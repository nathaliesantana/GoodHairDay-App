class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @categories = Category.all
    @product = Product.new
    @review.build_product
  end

  def show
    @review = Review.find_by_id(params[:id])
    # @product = Product.find_by_id(params[:id])
    # @Category = Category.find_by_id(params[:id])
    render :new if !@review
  end

  def create
    @product = Product.find_by(:name => review_params[:product_attributes][:name].downcase, :category_id => review_params[:product_attributes][:category_id])|| @product = Product.create(review_params[:product_attributes])
    @review = current_user.reviews.new(review_params)
    if @product
      @review.product_id = @product.id
      if @review.save
        @product.reviews << @review
        redirect_to @review
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
    @review = Review.find_by_id(params[:id])
  end

  def update
    @review = Review.find_by_id(params[:id])
    if session[:user_id] == @review.user_id
      @review.update(review_params)
      if @review.save
        redirect_to @review
      else
        render :edit
      end
    else
      redirect_to @review
    end

  end

  def destroy
    @review = Review.find_by_id(params[:id])
    if session[:user_id] == @review.user_id
      @review.destroy
      redirect_to '/'
    else
      redirect_to @review
    end
  end

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
