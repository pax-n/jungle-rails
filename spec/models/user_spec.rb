require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "is valid" do
      @user = User.create(
        name: 'HelloWorld',
        email: 'Hello@world.com',
        password: 'WorldHello',
        password_confirmation: 'WorldHello'
      )
      expect(@user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return user' do
      @user = User.create(
        name: 'HelloWorld',
        email: 'hello@world.com',
        password: 'WorldHello',
        password_confirmation: 'WorldHello'
      )
      @user2 = User.authenticate_with_credentials('hello@world.com', 'WorldHello')
      expect(@user2).to eq(@user)
    end
  end

  describe '.authenticate_with_credentials with wrong password' do
    it "should return nil" do
      @user = User.create(
        name: 'HelloWorld',
        email: 'hello@world.com',
        password: 'WorldHello',
        password_confirmation: 'WorldHello'
      )

      @user2 = User.authenticate_with_credentials('hello@world.com', '123')
      expect(@user2).to be nil
    end
  end

  describe '.authenticate_with_credentials with spaces' do
    it 'should return user' do
      @user = User.create(
        name: 'HelloWorld',
        email: 'hello@world.com',
        password: 'WorldHello',
        password_confirmation: 'WorldHello'
      )
      @user2 = User.authenticate_with_credentials(' hello@world.com ', 'WorldHello')
      expect(@user2).to eq(@user)
    end
  end

  describe '.authenticate_with_credentials with capital letters' do
    it 'should return user' do
      @user = User.create(
        name: 'HelloWorld',
        email: 'Hello@World.Com',
        password: 'WorldHello',
        password_confirmation: 'WorldHello'
      )
      @user.email.downcase!
      @user.save
      @user2 = User.authenticate_with_credentials('hElLo@WoRlD.cOm', 'WorldHello')
      expect(@user2).to eq(@user)
    end
  end

end
