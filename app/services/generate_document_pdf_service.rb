class GenerateDocumentPdfService
  def initialize(document)
    @document = document
  end

  def call
    generate_pdf
    save_temporary_pdf_file
    save_pdf_to_cloudinary
  end

  private

  def generate_pdf
    document_data = @document.data.deep_symbolize_keys

    html_pdf = ApplicationController.render(
      formats: :html,
      layout: 'pdf',
      template: 'documents/show_mandat.pdf.erb',
      encoding: 'UTF-8',
      assigns: {
        document: @document,
        house: document_data[:house],
        agence: document_data[:agence],
        user: document_data[:user],
        owner: document_data[:owner]
      },
      header: {
        font_name: 'Arial'
      }
    )

    @pdf = WickedPdf.new.pdf_from_string(html_pdf)
  end

  def save_temporary_pdf_file
    @temp_pdf_file = Tempfile.new(["document", ".pdf"])

    File.open(@temp_pdf_file, 'wb') do |file|
      file << @pdf
    end
  end

  def save_pdf_to_cloudinary
    @document.pdf = File.open(@temp_pdf_file.path)
    @document.save
  end
end
