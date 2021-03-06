require 'rails_helper'

RSpec.feature 'SignIns', type: :feature do
  before :each do
    @user = User.create(name: 'Peter', email: 'x@x.com', password: '123456')
    visit root_path
  end

  it 'user can login and it is redirected' do
    fill_in 'Email',	with: @user.email
    fill_in 'Password',	with: @user.password
    click_button 'Log in'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Signed in successfully.')
  end

  it 'wrong user can not login' do
    fill_in 'Email',	with: 'z1@z1.com'
    fill_in 'Password',	with: '123456'
    click_button 'Log in'
    expect(page).to have_no_text('Signed in successfully.')
  end
end
