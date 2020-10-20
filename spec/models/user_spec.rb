require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'should create a User if all validation checks are met' do
    @user = User.new(first_name: "Joe", last_name: "Bloggs", email: "Joesmith@email.com", password: "123456", password_confirmation: "123456")
    @user.valid?
    expect(@user.errors).not_to include("You must fill in all fields")
    end

    it 'should not create a User if a last name is not provided' do
    @user = User.new(first_name: "Joe", email: "Joesmith@email.com", password: "123456", password_confirmation: "123456")
    @user.valid?
    expect(@user.errors[:last_name]).to include("Last name must not be blank")
    end
    
    it 'should not create a User if a first name is not provided' do
    @user = User.new(last_name: "Bloggs", email: "Joesmith@email.com", password: "123456", password_confirmation: "123456")
    @user.valid?
    expect(@user.errors[:first_name]).to include("First name must not be blank")
    end

    it 'should not create a User if a email is not provided' do
    @user = User.new(last_name: "Bloggs", first_name: "Joe", password: "123456", password_confirmation: "123456")
    @user.valid?
    expect(@user.errors[:email]).to include("Email must be filled in")
    end

    it 'should not create a User if their email has been used to sign up with before' do
    @user1 = User.new(first_name: "Joe", last_name: "Bloggs", email: "Joe@gmail.com", password: "123456", password_confirmation: "123456")
    @user1.save
    @user2 = User.new(first_name: "Bill", last_name: "Ericsson", email: "Joe@gmail.com", password: "123456", password_confirmation: "123456")
    @user2.valid?
    expect(@user2.errors[:email]).to include("This email account has already been registered")
    end

    it 'should not create a User if passwords do not match with validation' do
    @user = User.new(first_name: "Joe", last_name: "Bloggs", email: "Joe@gmail.com", password: "123456", password_confirmation: "1234567")
    @user.valid?
    expect(@user.errors[:password_confirmation]).to include("Password does not match")
    end

    it 'should not create a User if there is no password provided' do
    @user = User.new(first_name: "Joe", last_name: "Bloggs", email: "Joe@gmail.com")
    @user.valid?
    expect(@user.errors[:password_digest]).to include("password cannot be blank")
    end

    it 'should not create a User if there the password is under 6 characters' do
    @user = User.new(first_name: "Joe", last_name: "Bloggs", email: "Joe@gmail.com", password: "ABC", password_confirmation: "ABC")
    @user.valid?
    expect(@user.errors[:password]).to include("password is too short they should be 6 characters or over")
    end
  end
end