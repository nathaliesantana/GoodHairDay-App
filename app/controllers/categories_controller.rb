class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    if current_user == admin?
      @category = Category.new
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
    if current_user == admin?
      Category.find_by_id(params[:id]).destroy
      redirect_to '/categories'
    else
      redirect_to '/'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
