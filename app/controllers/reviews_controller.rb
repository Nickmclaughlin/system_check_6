class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])

    if @review.save
      redirect_to @restaurant
    else
      flash[:notice] = "Please fill out correctly."
      render 'new'
    end

  end

  def review_params
    params.require(:review).permit(:rating, :body, :restaurant_id)
  end
end
