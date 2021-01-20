require 'rails_helper'

RSpec.feature "CreatePosts", type: :feature do
  before :each do
    @user = User.create(name: 'Peter', email: 'x@x.com', password: '123456')
    @post = Post.new(user: @user, content: 'Hello!')
    visit '/index'
  end

  it 'user can login and it is redirected' do
    fill_in post_content,	with: @post.content
    fill_in 'Password',	with: @user.password
    click_button 'LOG IN'
    expect(current_path).to eq(root)
    expect(page).to have_text('Signed in successfully.')
  end
end
