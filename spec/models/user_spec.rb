require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'should create a User if all of the validations are true' do
    @user = User.new(first_name: "Joe", last_name: "Bloggs", email: "Joesmith@email.com", password: "123456", password_confirmation: "123456")
    @user.valid?
    expect(@user.errors).not_to include("can\'t be blank")
    end

    it 'should not create a User if their last name is missing' do
    @user = User.new(first_name: "Joe", email: "Joesmith@email.com", password: "123456", password_confirmation: "123456")
    @user.valid?
    expect(@user.errors[:last_name]).to include("can\'t be blank")
    end
    
    it 'should not create a User if their first name is missing' do
    @user = User.new(last_name: "Bloggs", email: "Joesmith@email.com", password: "123456", password_confirmation: "123456")
    @user.valid?
    expect(@user.errors[:first_name]).to include("can\'t be blank")
    end

    it 'should not create a User if their email is missing' do
    @user = User.new(last_name: "Bloggs", first_name: "Joe", password: "123456", password_confirmation: "123456")
    @user.valid?
    expect(@user.errors[:email]).to include("can\'t be blank")
    end

    it 'should not create a User if their email is not unique' do
    @user1 = User.new(first_name: "Joe", last_name: "Bloggs", email: "Joe@gmail.com", password: "123456", password_confirmation: "123456")
    @user1.save
    @user2 = User.new(first_name: "Bill", last_name: "Ericsson", email: "Joe@gmail.com", password: "123456", password_confirmation: "123456")
    @user2.valid?
    expect(@user2.errors[:email]).to include("has already been taken")
    end

    it 'should not create a User if their passwords do not match' do
    @user = User.new(first_name: "Joe", last_name: "Bloggs", email: "Joe@gmail.com", password: "123456", password_confirmation: "1234567")
    @user.valid?
    expect(@user.errors[:password_confirmation]).to include("doesn\'t match Password")
    end

    it 'should not create a User if there is no password' do
    @user = User.new(first_name: "Joe", last_name: "Bloggs", email: "Joe@gmail.com")
    @user.valid?
    expect(@user.errors[:password_digest]).to include("can\'t be blank")
    end
    
    it 'should not create a User if there the password is too short' do
    @user = User.new(first_name: "Joe", last_name: "Bloggs", email: "Joe@gmail.com", password: "ABC", password_confirmation: "ABC")
    @user.valid?
    expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end