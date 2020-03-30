class ReviewsController < ApplicationController

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
    @product = Product.find_or_create_by(review_params[:product_attributes])
    @review = current_user.reviews.new(review_params)
    if @product
      @review.product_id = @product.id
      if @review.save
        redirect_to @review
      else
        render :new
      end
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
      product_attributes: [:name,:brand,:category_id]
    )
  end

end
