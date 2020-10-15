# Add a controller for user session
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # Does an existing user put in the correct password?
    if user && user.authenticate(params[:password])
      # We save the user information in a browser cookie
      # user remains logged in as they navigate page to page
      session[:user_id] = user.id
      redirect_to :root

    else
    # Returns a user to login form if they don't authenticate.
      redirect_to [:new, :session]
    end

  end

#destroy cookie on logout
  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

end