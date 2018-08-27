class CreateDocumentTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :document_templates do |t|
      t.string :type

      t.timestamps
    end
  end
end
