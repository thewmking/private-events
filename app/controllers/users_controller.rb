class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created! You are now logged in!"
      log_in @user
      redirect_to root_url
    else
      flash[:warning] = "That name is already taken. Please try again."
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
    @past_events = @user.events.past
    @future_events = @user.events.future
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
