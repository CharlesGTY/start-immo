class DocumentsController < ApplicationController
  before_action :document_selector, only: [:show]

  def create
    @house = House.find(params[:house_id])
    @document = Document.new(document_params)
    @document.document_type_id = params[:document][:document_type_id]
    @user = @house.user
    @owner = @house.owner
    @agence = @house.user.agence
    @document.house = @house
    @document.data = store_hash(@house, @agence, @owner, @user)
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
    data = @document.data.deep_symbolize_keys
    h = data[:house]
    u = data[:user]
    o = data[:owner]
    a = data[:agence]
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
        render pdf: 'Hello',   # Excluding ".pdf" extension.
               template: "documents/show.pdf.erb",
               locals: {document: @document, house: h, agence: a, user: u, owner: o}
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

  def store_hash(house, agence, owner, user)
    {
      house: {
        owner_id: house.owner_id,
        user_id: house.user_id,
        address: house.address,
        description: house.description,
        house_type: house.house_type,
        usage_type: house.usage_type,
        notary_name: house.notary_name,
        smoke_detector_presence: house.smoke_detector_presence,
        nb_rooms: house.nb_rooms,
        nb_bedrooms: house.nb_bedrooms,
        nb_livingrooms: house.nb_livingrooms,
        nb_diningrooms: house.nb_diningrooms,
        nb_bathrooms: house.nb_bathrooms,
        equiped_kitchen: house.equiped_kitchen,
        nb_showers: house.nb_showers,
        nb_bathtubs: house.nb_bathtubs,
        nb_terraces: house.nb_terraces,
        nb_balconies: house.nb_balconies,
        surface_living: house.surface_living,
        surface_Carrez: house.surface_Carrez,
        surface_total: house.surface_total,
        dpe_done: house.dpe_done,
        energy_consumption: house.energy_consumption,
        ges_emission: house.ges_emission
      },
      agence: {
        enseigne_name: agence.enseigne_name,
        social_denomination: agence.social_denomination,
        juridic_form: agence.juridic_form,
        email: agence.email,
        phone_number: agence.phone_number,
        fax: agence.fax,
        address: agence.address,
        city: agence.city,
        director_first_name: agence.director_first_name,
        director_last_name: agence.director_last_name,
        director_card_number: agence.director_card_number,
        director_card_date: agence.director_card_date,
        director_card_city: agence.director_card_city,
        vat_number: agence.vat_number,
        siren_number: agence.siren_number,
        insurance_number: agence.insurance_number,
        social_capital: agence.social_capital,
        professional_card_mention: agence.professional_card_mention,
        civil_respons_insurance_name: agence.civil_respons_insurance_name,
        civil_respons_insurance_address: agence.civil_respons_insurance_address,
        civil_respons_police_number: agence.civil_respons_police_number,
        civil_respons_police_geo_zone: agence.civil_respons_police_geo_zone
      },
      owner: {
        last_name: owner.last_name,
        first_name: owner.first_name,
        email: owner.email,
        phone_number: owner.phone_number,
        address: owner.address,
        birth_date: owner.birth_date,
        birth_place: owner.birth_place,
        is_business: owner.is_business,
        company_name: owner.company_name,
        siret_number: owner.siret_number,
        rcs_number: owner.rcs_number,
        hq_address: owner.hq_address
      },
      user: {
        email: user.email,
        encrypted_password: user.encrypted_password,
        reset_password_token: user.reset_password_token,
        reset_password_sent_at: user.reset_password_sent_at,
        remember_created_at: user.remember_created_at,
        created_at: user.created_at,
        updated_at: user.updated_at,
        agence: user.agence,
        agence_id: user.agence_id,
        first_name: user.first_name,
        last_name: user.last_name,
        phone_number: user.phone_number,
        attes_collab_number: user.attes_collab_number,
        attes_collab_number_date: user.attes_collab_number_date,
        attes_collab_number_city: user.attes_collab_number_city
      }
    }
  end

end
