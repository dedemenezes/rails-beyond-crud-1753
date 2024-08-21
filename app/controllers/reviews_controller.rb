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
      # Redirect To
      # It forces the user's browser to make a new request to the provided
      # path. In this case, the user will make a GET request to /restaurants/some-id
      redirect_to restaurant_path(@restaurant)
    else
      # Render
      # It skips the controller+action,
      # it just goes straight to the view and render it (which means, we
      # need all the variables from that view in the action that you render.
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
