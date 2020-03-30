class ProductsController < ApplicationController

  def index
    @products = Product.all
    @single_products = @products.map { |f| f.name.downcase }.uniq
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
    @product = Product.new(product_params)
    if @product.save
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
