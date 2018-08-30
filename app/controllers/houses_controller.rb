class HousesController < ApplicationController
  before_action :house_selector, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @house = House.new
    @owner = Owner.new
    authorize @house
  end

  def create
    @house = House.new(house_params)
    if Owner.find_by(owner_params).nil?
      @owner = Owner.new(owner_params)
    else
      @owner = Owner.find_by(owner_params)
    end
    @house.owner = @owner
    @house.user = current_user
    authorize @house
    @owner.save
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
    params.require(:house).permit(
      :owner,
      :user,
      :address,
      :description,
      :house_type,
      :usage_type,
      :notary_name,
      :smoke_detector_presence,
      :nb_rooms,
      :nb_bedrooms,
      :nb_livingrooms,
      :nb_diningrooms,
      :nb_bathrooms,
      :equiped_kitchen,
      :nb_showers,
      :nb_bathtubs,
      :nb_terraces,
      :nb_balconies,
      :surface_living,
      :surface_Carrez,
      :surface_total,
      :dpe_done,
      :energy_consumption,
      :ges_emission
    )
  end

  def owner_params
    params.require(:house).require(:owner).permit(
      :first_name,
      :last_name,
      :address,
      :email
    )
  end
end
