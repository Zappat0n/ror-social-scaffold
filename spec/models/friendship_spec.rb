require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) { User.new(name: 'Peter', email: 'x@x.com', password: '123456') }
  let(:friend) { User.new(name: 'John', email: 'y@y.com', password: '123456') }
  let(:friendship) { Friendship.create(user: user, friend: friend) }

  it 'creates a friendship correctly' do
    expect(friendship.valid?).to be true
  end

  it 'friendship default status should be false' do
    expect(friendship.status).to be nil
  end

  it 'can create a friendship through user' do
    new_friendship = user.friendships.build(friend: friend)
    expect(new_friendship.valid?).to be true
  end

  #  it 'if one user is friend of another user, that user is also friend of the first' do
  #    friendship.update(status: true)
  #    expect(friend.friendships.exists?(user.id)).to be true
  #  end
end
