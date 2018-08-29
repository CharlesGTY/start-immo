class OwnersController < ApplicationController
  before_action :owner_selector, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @owner = House.new
    @owner = current_user
    authorize @owner
  end

  def create
    @owner = Owner.new(owner_params)
    @owner.user = current_user
    authorize @owner
    if @owner.save
      redirect_to owner_path(@owner)
    else
      render :new
    end
  end

  def owner_selector
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :address, :email, :phone_number)
  end
end
