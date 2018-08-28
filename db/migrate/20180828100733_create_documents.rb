class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.references :house, foreign_key: true
      t.references :document_type, foreign_key: true
      t.integer :status
      t.text :data
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
