class CreateAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :agents do |t|
      t.references :agence, foreign_key: true
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :attes_collab_number
      t.date :attes_collab_number_date
      t.string :attes_collab_number_city

      t.timestamps
    end
  end
end
