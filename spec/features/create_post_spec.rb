require 'rails_helper'

RSpec.feature "CreatePosts", type: :feature do
  before :each do
    @user = User.create(name: 'Peter', email: 'x@x.com', password: '123456')
    @post = Post.new(user: @user, content: 'Hello!')
    visit root
  end

  it 'user can create a post' do
    fill_in post_content,	with: @post.content
    click_button 'SAVE'
    expect(current_path).to eq(root)
    expect(page).to have_text('Post was successfully created.')
  end
end
