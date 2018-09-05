class CreateDocusignEnvelopService
  def initialize(document)
    @document = document
  end

  def call
    # download cloudinary PDF file
    temp_pdf_file = Tempfile.new(["document", ".pdf"])

     File.open(temp_pdf_file, 'wb') do |file|
       file << open(@document.pdf.url).read
     end

    # File.open(temp_pdf_file, 'wb') do |file|{ file << open(@document.pdf.url).read }

    client = DocusignRest::Client.new
    document_envelope_response = client.create_envelope_from_document(
      email: {
        subject: "Mandat n°#{@document.id} à signer",
        body: "Merci de signer ce mandat "
      },
      # If embedded is set to true in the signers array below, emails
      # don't go out to the signers and you can embed the signature page in an
      # iframe by using the client.get_recipient_view method
      signers: [
        {
          embedded: false,
          name: "#{@document.house.user.first_name} #{@document.house.user.last_name}",
          email: "mottet.julien123@gmail.com",
          role_name: 'Mandataire',
          sign_here_tabs: [
            {
              anchor_string: 'Mandataireeee',
              anchor_x_offset: '200',
              anchor_y_offset: '35'
            }
          ]
        },
        {
          embedded: false,
          name: "#{@document.house.owner.first_name} #{@document.house.owner.last_name}",
          email: "mottet.julien123@gmail.com",
          role_name: 'Owner',
          sign_here_tabs: [
            {
              anchor_string: 'Proprietaireeee',
              anchor_x_offset: '200',
              anchor_y_offset: '35'
            }
          ]
        },
        # {
        #   embedded: true,
        #   name: 'tim',
        #   email: 'someone+else@gmail.com',
        #   role_name: 'Attorney',
        #   sign_here_tabs: [
        #     {
        #       anchor_string: 'attorney_sig',
        #       anchor_x_offset: '140',
        #       anchor_y_offset: '8'
        #     }
        #   ]
        # }
      ],
      files: [
        # {path: 'http://res.cloudinary.com/foodfutur/image/upload/v1535987118/4_0_pdf.pdf', name: '4_0_pdf.pdf' },
        {path: temp_pdf_file.path, name: 'document.pdf' },
      ],
      status: 'sent'
    )

    # raise document_envelope_response["message"] if document_envelope_response.has?("errorCode")
    @document.update!(
      docusign_envelope_id: document_envelope_response['envelopeId'],
      # uri: document_envelope_response['uri']
    )
  end
end
