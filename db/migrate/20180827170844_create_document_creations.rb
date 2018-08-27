class CreateDocumentCreations < ActiveRecord::Migration[5.2]
  def change
    create_table :document_creations do |t|
      t.references :house, foreign_key: true
      t.references :document_template, foreign_key: true
      t.references :document_status, foreign_key: true

      t.timestamps
    end
  end
end
