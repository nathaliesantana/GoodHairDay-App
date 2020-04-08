class CategoriesController < ApplicationController

  def new
    @category = Category.new
    @categories = Category.all
  end

  def show
    @category = Category.find_by_id(params[:id])
    render :new if !@category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new
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
