class DocumentsController < ApplicationController
  before_action :document_selector, only: [:show]

  def create
    @house = House.find(params[:house_id])
    @document = Document.new(document_params)
    @document.document_type_id = params[:document][:document_type_id]
    @document.house = @house
    @document.data = store_hash(@house)
    authorize @document
    if @document.save
      redirect_to house_path(@house)
    else
      render 'houses/show'
    end
  end

  def index
  end

  def show
    @house = House.find(params[:house_id])
    @user = @house.user
    @owner = @house.owner
    @agence = @house.user.agence
    authorize @document
    #template = "document/show.pdf.erb"
    #case condition
    #  when valeur then template = "document/show.pdf.erb"
    #  when valeur then template = "document/show.pdf.erb"
    #  when valeur then template = "document/show.pdf.erb"
    #  when valeur then template = "document/show.pdf.erb"
    #  else template = "document/show.pdf.erb"
    #end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@house.address} - #{@document.document_type_id} - #{@document.created_at}",   # Excluding ".pdf" extension.
               template: "documents/show.pdf.erb",
               locals: {document: @document, agence: @agence, user: @user, owner: @owner}
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def document_selector
    @document = Document.find(params[:id])
  end

  def document_params
    params.require('document').permit(:data, :status, :document_type)
  end

  def store_hash(house)
      {
      "owner_id" => house.owner_id,
      "user_id" => house.user_id,
      "address" => house.address,
      "description" => house.description,
      "house_type" => house.house_type,
      "usage_type" => house.usage_type,
      "notary_name" => house.notary_name,
      "smoke_detector_presence" => house.smoke_detector_presence,
      "nb_rooms" => house.nb_rooms,
      "nb_bedrooms" => house.nb_bedrooms,
      "nb_livingrooms" => house.nb_livingrooms,
      "nb_diningrooms" => house.nb_diningrooms,
      "nb_bathrooms" => house.nb_bathrooms,
      "equiped_kitchen" => house.equiped_kitchen,
      "nb_showers" => house.nb_showers,
      "nb_bathtubs" => house.nb_bathtubs,
      "nb_terraces" => house.nb_terraces,
      "nb_balconies" => house.nb_balconies,
      "surface_living" => house.surface_living,
      "surface_Carrez" => house.surface_Carrez,
      "surface_total" => house.surface_total,
      "dpe_done" => house.dpe_done,
      "energy_consumption" => house.energy_consumption,
      "ges_emission" => house.ges_emission
      }

  end

end
