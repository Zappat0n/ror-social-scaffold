class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :confirmed_friendships, -> { where status: true }, class_name: 'Friendship'
  has_many :friends, through: :confirmed_friendships

  # Users who needs to confirm friendship
  has_many :pending_friendships, -> { where status: false }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :pending_friends, through: :pending_friendships, source: :friend

  # Users who requested to be friends (needed for notifications)
  has_many :inverted_friendships, -> { where status: false }, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :friend_requests, through: :inverted_friendships, source: :user

  def friend?(user)
    friends.include?(user)
  end

  def pending_friends_or_friends?(user)
    friends.include?(user) || pending_friends.include?(user)
  end

  def friends_and_own_posts
    Post.where(user: (friends.to_a << self))
    # This will produce SQL query with IN. Something like: select * from posts where user_id IN (1,45,874,43);
  end
end
