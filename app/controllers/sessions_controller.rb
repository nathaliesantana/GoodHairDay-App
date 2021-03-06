class SessionsController < ApplicationController

  def home

  end

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    @user = @user.try(:authenticate, params[:user][:password])
    if @user
      log_in @user
      redirect_to @user
    else
      flash[:danger] = 'Invalid name/password combination'
      render :new
    end
  end


  def destroy
    log_out
    redirect_to root_path '/'
  end

  private


end
