# A controller for the users inherits application controller
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      #create a session cookie
      session[:user_id] = user.id
      #redirect after login
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    #We'll collect the following information for users when registering them:
# First name
# Last name
# E-mail
# Password

    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    #Once a user registers an account successfully, they should also be logged in at that time. In other words, they should not have to log in after registering.
  end

end