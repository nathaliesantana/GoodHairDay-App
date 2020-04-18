class CategoriesController < ApplicationController
  before_action :require_admin, except: :show

  def index
    @categories = Category.all
  end

  def new
      @category = Category.new
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
    Category.find_by_id(params[:id]).destroy
    redirect_to '/categories'

  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
