class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    redirect_to '/' if !@user
  end

  def create
    if auth_hash = auth
      auth_username = auth['info']['name']
      auth_email = auth['info']['email']
      if @user = User.find_by(:username => auth_username)
        session[:user_id] = @user.id
        redirect_to @user
      else
        @user = User.new(:email => auth_email, :username => auth_username, :password => SecureRandom.hex)
        if @user.save
          session[:user_id] = @user.id
          redirect_to @user
        else
          raise user.errors.full_messages.inspect
        end
      end
    else
      @user = User.new(user_params)
      if @user.save
        log_in @user
        redirect_to @user
      else
        render :new
      end
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :hair_texture, :hair_structure, :scalp_moist)
  end

  def auth
    request.env['omniauth.auth']
  end


end
