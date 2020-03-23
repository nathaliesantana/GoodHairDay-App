class ReviewsController < ApplicationController

  def index

  end

  def new
    @review = Review.new
    @categories = Category.all
    @review.build_product
  end

  def show
    @review = Review.find_by_id(params[:id])
    # @product = Product.find_by_id(params[:id])
    # @Category = Category.find_by_id(params[:id])
    render :new if !@review
  end

  def create
    @review = Review.new(review_params)
    # @review = @review.product.category_id.tap{|x| x[/\d+/]}
    # @product = Product.new
    # @category = Category.new
    if @review.save
      redirect_to @review
    else
      render :new
    end
  end

  # def all_reviews(product)
  #   @productreviews = Review.all.select {|r| r.product_id == 1}
  # end

  private
  def review_params
    params.require(:review).permit(
      :animal_tested,
      :country_of_origin,
      :paraben,
      :silicone,
      :sulfate,
      :rating,
      :comment,
      :user_id,
      :product_id,
      product_attributes: [:name,:brand,:category_id]
    )
  end

end
