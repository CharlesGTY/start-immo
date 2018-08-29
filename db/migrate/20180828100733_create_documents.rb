class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.references :house, foreign_key: true
      t.references :document_type, foreign_key: true
      t.string :status, default: 'attente signature agent'
      t.text :data

      t.timestamps
    end
  end
end
