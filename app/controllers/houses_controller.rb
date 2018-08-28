class HousesController < ApplicationController
before_action :house_selector, only: [:show]

  def index
    @houses = House.all
  end

  def new
    @house = House.new
    @owner = current_user
  end

  def create
  end

  def show
  end

  def house_selector
    @house = House.find(params[:id])
  end

  def house_params
  params.require(:article).permit(:address, :description, :photo)
  end
end
