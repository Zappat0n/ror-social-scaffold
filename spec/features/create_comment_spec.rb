require 'rails_helper'

RSpec.feature "CreateComments", type: :feature do
  before :each do
    @user = User.create(name: 'Peter', email: 'x@x.com', password: '123456')
    @post = Post.create(user: @user, content: 'Hello!')
    visit root_path
  end

  it 'user can create a comment' do
    fill_in 'comment_content',	with: 'I like your post'
    click_button 'COMMENT'
    expect(current_path).to eq(root)
    expect(page).to have_text('Comment was successfully created.')
  end
end
