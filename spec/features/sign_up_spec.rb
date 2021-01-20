require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  before :each do
    @user = User.new(name: 'Peter', email: 'x@x.com', password: '123456')
    visit new_user_registration_path
  end

  it 'user can sign up and it is redirected' do
    fill_in 'Name',	with: @user.name
    fill_in 'Email',	with: @user.email
    fill_in 'Password',	with: @user.password
    fill_in 'Password confirmation',	with: @user.password
    click_button 'SIGN UP'
    expect(current_path).to eq(root)
    expect(page).to have_text('Welcome! You have signed up successfully.')
  end

  it 'name can not be empty' do
    fill_in 'Email',	with: @user.email
    fill_in 'Password',	with: @user.password
    fill_in 'Password confirmation',	with: @user.password
    click_button 'SIGN UP'
    expect(page).to have_text("Name can't be blank")
  end

  it 'email can not be empty' do
    fill_in 'Name',	with: @user.name
    fill_in 'Password',	with: @user.password
    fill_in 'Password confirmation',	with: @user.password
    click_button 'SIGN UP'
    expect(page).to have_text("Email can't be blank")
  end

  it 'password can not be empty' do
    fill_in 'Name',	with: @user.name
    fill_in 'Email',	with: @user.email
    fill_in 'Password confirmation',	with: @user.password
    click_button 'SIGN UP'
    expect(page).to have_text("Password can't be blank")
  end

  it 'password and password confirmation should be equal' do
    fill_in 'Name',	with: @user.name
    fill_in 'Email',	with: @user.email
    fill_in 'Password',	with: @user.password
    fill_in 'Password confirmation',	with: ' '
    click_button 'SIGN UP'
    expect(page).to have_text("Password confirmation doesn't match Password")
  end

  it 'email must be unique' do
    @user2 = User.create(name: 'Peter', email: 'x@x.com', password: '123456')

    fill_in 'Name',	with: @user.name
    fill_in 'Email',	with: @user.email
    fill_in 'Password',	with: @user.password
    fill_in 'Password confirmation',	with: @user.password
    click_button 'SIGN UP'
    expect(page).to have_no_text('Email has already been taken')
  end
end