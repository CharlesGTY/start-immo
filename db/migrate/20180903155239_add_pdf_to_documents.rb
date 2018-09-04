class AddPdfToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :pdf, :string
  end
end
