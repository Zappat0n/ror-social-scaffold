require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'creates a like correctly' do
    user = User.new(name: 'Peter', email: 'x@x.com', password: '123456')
    post = Post.create(content: 'Hello!', user: user)
    like = Like.create(user: user, post: post)
    expect(like.valid?).to be true
  end
end
