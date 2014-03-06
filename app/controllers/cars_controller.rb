class CarsController < ApplicationController
  def index

  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    redirect_to cars_path, notice: "#{@car.year} #{@car.make} #{@car.model} has been created"
  end

  private
  # to fix ActiveModel::ForbiddenAttributesError
  def car_params
    params.require(:car).permit(:make, :model, :year, :price)
  end
end
