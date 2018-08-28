class HousesController < ApplicationController
  before_action :house_selector, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @house = House.new
    @owner = current_user
    authorize @house
  end

  def create
    @house = House.new(house_params)
    @house.user = current_user
    authorize @house
    if @house.save
      redirect_to house_path(@house)
    else
      render :new
    end
  end

  def index
    if params[:query].present?
      @houses = policy_scope(House).order(created_at: :desc)
      @houses = House.global_search(params[:query])
      authorize @houses
    else
      @houses = policy_scope(House).order(created_at: :desc)
      authorize @houses
    end
  end

  def show
    @document = Document.new
    authorize @house
  end

  def house_selector
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:article).permit(:address, :description, :photo)
  end
end
