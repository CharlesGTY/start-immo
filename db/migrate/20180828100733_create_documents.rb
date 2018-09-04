class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.references :house, foreign_key: true
      t.references :document_type, foreign_key: true
      t.integer :docusign_envelope_id, default: '0'
      t.jsonb :data, null: false, default: '{}'
      t.string :cl_pdf_name

      t.timestamps
    end
  end
end
