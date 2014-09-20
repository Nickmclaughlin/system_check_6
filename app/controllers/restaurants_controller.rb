class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.limit
    @posts = Restaurant.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end


  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zip)
  end
end
