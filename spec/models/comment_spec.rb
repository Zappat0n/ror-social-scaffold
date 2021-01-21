require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'creates a comment correctly' do
    user = User.new(name: 'Peter', email: 'x@x.com', password: '123456')
    post = Post.create(content: 'Hello!', user: user)
    comment = Comment.create(user: user, post: post, content: 'Nice post')
    expect(comment.valid?).to be true
  end

  it 'comment must have content' do
    user = User.new(name: 'Peter', email: 'x@x.com', password: '123456')
    post = Post.create(content: 'Hello!', user: user)
    comment = Comment.create(user: user, post: post)
    expect(comment.valid?).to be false
  end
end
