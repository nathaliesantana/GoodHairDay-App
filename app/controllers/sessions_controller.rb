class SessionsController < ApplicationController

  def home
  end

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      log_in @user
      redirect_to @user
    else
      flash[:danger] = 'Invalid name/password combination'
      redirect_to @user
    end
  end

  def destroy

  end

end
