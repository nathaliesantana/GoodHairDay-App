class ProductsController < ApplicationController

  def index
    @products = Product.all
    @single_products = @products.map { |f| f.name}.uniq
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def show
    @product = Product.find_by_id(params[:id])
    render :new if !@product
  end

  def create
    @product = Product.find_or_create_by(product_params)
    if @product
      redirect_to @product
    else
      flash[:error]
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :brand, :category_id)
  end
end
