class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  self.primary_keys = :user_id, :friend_id
end
