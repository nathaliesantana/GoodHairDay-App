class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def show
    @product = Product.find_by_id(params[:id])
    render :new if !@product
  end

end
