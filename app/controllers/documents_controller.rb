require "tempfile"
require "open-uri"

class DocumentsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :webhooks
  before_action :document_selector, only: [:show, :esign]

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
      GenerateDocumentPdfService.new(@document).call
    else
      render 'houses/show'
    end
  end

  def index
  end

  def show
    # data = @document.data.deep_symbolize_keys
    # h = data[:house]
    # u = data[:user]
    # o = data[:owner]
    # a = data[:agence]
    # authorize @document
    # template = "documents/show_mandat.pdf.erb"
    # case @document.document_type.name
    #   when "Mandat de vente" then template = "documents/show_mandat.pdf.erb"
    #   when "Avenant au mandat de vente -> Prix" then template = "documents/show_avenant_prix.pdf.erb"
    # #  when valeur then template = "document/show.pdf.erb"
    # #  when valeur then template = "document/show.pdf.erb"
    # #  else template = "document/show.pdf.erb"
    # #end
    # end

    # # tempfile = Tempfile.new("document.pdf")
    # @document.reload
    # tempfile = Tempfile.new(['document','.pdf.erb'], File.expand_path('') + '/app/views/documents')
    # File.open(tempfile,'wb') do |file|
    #   file << open(@document.pdf.url).read
    # end

    # # File.open(File.dirname(__FILE__) +'show_avenant_prix.pdf.erb','wb') do |file|
    # #   file << open(@document.pdf.url).read
    # # end
    # authorize @document
    # raise
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     render pdf: temfile.path.slice('views')[1],
    #            template: '/documents/show_mandat.pdf.erb',
    #            layout: 'pdf',
    #            formats: :html,
    #            encoding: 'utf8'
    #   end
    # end


    # # Cloudinary::Uploader.upload("app/pdfs/temp.pdf", :public_id => "#{@document.id}_#{@document.docusign_envelope_id}_pdf")
    # # @document.update(cl_pdf_name: "#{@document.id}_#{@document.docusign_envelope_id}_pdf")

    # @document.update(pdf: File.open(tempfile.path))
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def esign
    authorize @document
    if CreateDocusignEnvelopService.new(@document).call
      respond_to do |format|
        format.html {redirect_to house_path(@document.house)}
        format.js
      end
    else
      respond_to do |format|
        format.html {redirect_to house_path(@document.house)}
        format.js
      end
    end
  end

  def webhooks
    notif = Notification.create(description: "Nouveau document signé")
    authorize notif
    redirect_to houses_path
  end
    # house = @document.house
    # authorize @document

    # # pdf_path = "#{cl_image_path(@document.cl_pdf_name)}.pdf"
    # # pdf_name = "#{@document.cl_pdf_name}.pdf"
    # tempfile = Tempfile.new("document.pdf")
    # tempfile.write(open(@document.pdf.url).read)

    # client = DocusignRest::Client.new
    # envelope = client.create_envelope_from_document(
    #   email: {
    #     subject: "test email subject",
    #     body: "this is the email body and it's large!"
    #   },
    #   # If embedded is set to true in the signers array below, emails
    #   # don't go out to the signers and you can embed the signature page in an
    #   # iframe by using the client.get_recipient_view method
    #   signers: [
    #     {
    #       embedded: false,
    #       name: "Joe Dimaggio",
    #       email: "mottet.julien123@gmail.com",
    #       role_name: 'Issuer',
    #       sign_here_tabs: [
    #         {
    #           anchor_string: 'THIS SPACE INTENTIONALLY LEFT BLANK',
    #           anchor_x_offset: '-30',
    #           anchor_y_offset: '35'
    #         }
    #       ]
    #     },
    #   ],
    #   files: [
    #     # {path: 'http://res.cloudinary.com/foodfutur/image/upload/v1535987118/4_0_pdf.pdf', name: '4_0_pdf.pdf' },
    #     {path: tempfile.path, name: 'document.pdf' },
    #   ],
    #   status: 'sent'
    # )
    # envelope = client2.create_envelope_from_document(
    #  { email: {
    #     subject: "pdf to sign",
    #     body: "please sign this mandat"
    #   },
    #   documents: [{
    #     documentId: "1",
    #     path: '/Users/julienmottet/code/CharlesGTY/start-immo/app/views/documents',
    #     name: "test.pdf"
    #   }],
    #   # If embedded is set to true in the signers array below, emails
    #   # don't go out to the signers and you can embed the signature page in an
    #   # iframe by using the client.get_recipient_view method
    #   recipients: {
    #     signers: [{
    #       name: "Joe Dimaggio",
    #       email: "mottet.julien123@gmail.com",
    #       recipientId: "1",
    #       routingOrder: "1",
    #       tabs: {
    #         sign_here_tabs: [{
    #           anchor_string: 'all your money',
    #           anchor_x_offset: '-30',
    #           anchor_y_offset: '35'
    #         }]
    #       }
    #     }]
    #   }
    # }
    # )
    # url = client2.get_recipient_view(envelope_id: envelope['envelopeId'], name: 'Joe Dimaggio', email: 'mottet.julien123@gmail.com', return_url: 'http://google.com')['url']
    # binding.pry

    # `open #{url}`

    # @document.update(docusign_envelope_id: envelope["envelopeId"])
    # redirect_to house_path(house)


  private

  def document_selector
    @document = Document.find(params[:id])
  end

  def document_params
    params.require('document').permit(:data, :status, :document_type, :docusign_envelope_id, :pdf)
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
