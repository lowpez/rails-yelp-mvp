class RestaurantsController < ApplicationController
  before_action :restaurant_params, only: [:show]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(set_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    @restaurant = Restaurant.find(params[:id])
  end

  def set_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
