class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user != nil
      log_in user
      redirect_to user
    else
      message = "Account does not exist. Click 'Sign Up' to create an account"
      flash[:warning] = message
      redirect_to root_url
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
