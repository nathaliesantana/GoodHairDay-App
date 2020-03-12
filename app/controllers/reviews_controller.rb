class ReviewsController < ApplicationController

  def new
    @review = Review.new
    # @product = Product.new
    # @category = Category.new
  end

  def show
    @review = Review.find_by_id(params[:id])
    # @product = Product.find_by_id(params[:id])
    # @Category = Category.find_by_id(params[:id])
    render :new if !@review
  end

  def create
    @review = Review.new(review_params)
    # @product = Product.new
    # @category = Category.new
    if @review.save
      redirect_to @review
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(
      :name,
      :brand,
      :category_id,
      :animal_tested,
      :country_of_origin,
      :paraben,
      :silicone,
      :sulfate,
      :rating,
      :comment,
      :user_id,
      :product_id,
    )
  end

end
