class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create

  end

  def show

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :hair_texture, :hair_structure, :scalp_moist)
  end

end
