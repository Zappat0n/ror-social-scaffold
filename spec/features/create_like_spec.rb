require 'rails_helper'

RSpec.feature "CreateLikes", type: :feature do
  before :each do
    @user = User.create(name: 'Peter', email: 'x@x.com', password: '123456')
    @post = Post.create(user: @user, content: 'Hello!')
    visit root
  end

  it 'user can create a like' do
    fill_in :form-control,	with: 'I like your post'
    click_like 'Like!'
    expect(current_path).to eq(root)
    expect(page).to have_text('You liked a post.')
  end

  it 'user can destroy a like' do
    fill_in :form-control,	with: 'I like your post'
    click_like 'Dislike!'
    expect(current_path).to eq(root)
    expect(page).to have_text('You disliked a post.')
  end

end
