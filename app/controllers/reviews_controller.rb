class ReviewsController < ApplicationController
  before_action :set_restaurant, except: [:destroy]

  def new
    @review = Review.new
    # find the specific restaurant for this review
  end

  def create
    @review = Review.new(review_params)
    # Find the restaurant
    # Assign the restaurant to the new review
    @review.restaurant = @restaurant # AN INSTANCE OF RESTAURANT
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
