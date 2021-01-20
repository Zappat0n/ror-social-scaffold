require 'rails_helper'

RSpec.feature "CreatePosts", type: :feature do
  before :each do
    @user = User.create(name: 'Peter', email: 'x@x.com', password: '123456')
    @post = Post.new(user: @user, content: 'Hello!')
    visit root_path
  end

#  it 'user can create a post' do
#    fill_in 'Content',	with: @post.content
#    click_button 'Save'
#    expect(current_path).to eq(root_path)
#    expect(page).to have_text('Post was successfully created.')
#  end
end
