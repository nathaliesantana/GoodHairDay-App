class CategoriesController < ApplicationController

  def new
    if current_user == admin?
      @category = Category.new
      @categories = Category.all
    else
      redirect_to '/'
    end
  end

  def show
    @category = Category.find_by_id(params[:id])
    render :new if !@category
  end

  def create
    if current_user == admin?
      @category = Category.new(category_params)
      if @category.save
        redirect_to @category
      else
        render :new
      end
    else
      redirect_to '/'
    end
  end

  def destroy
    @category = Category.find_by_id(params[:id])
    if session[:user_id] == @admin
      @category.destroy
      redirect_to '/'
    else
      redirect_to @category
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
