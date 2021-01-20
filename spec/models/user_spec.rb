require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates user correctly' do
    @user = User.new(name: 'Peter', email: 'x@x.com', password: '123456')
    expect(@user.valid?).to be true
  end

  it 'user must have email' do
    @user = User.new(name: 'Peter', password: '123456')
    expect(@user.valid?).to be false
  end

  it 'user must have password' do
    @user = User.new(name: 'Peter', email: 'x@x.com')
    expect(@user.valid?).to be false
  end
end
