class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.references :owner, foreign_key: true
      t.references :user, foreign_key: true
      t.string :address
      t.string :description
      t.string :type
      t.string :usage_type
      t.string :notary_name
      t.boolean :smoke_detector_presence
      t.integer :nb_rooms
      t.integer :nb_bedrooms
      t.integer :nb_livingrooms
      t.integer :nb_diningrooms
      t.integer :nb_bathrooms
      t.boolean :equiped_kitchen
      t.integer :nb_showers
      t.integer :nb_bathtubs
      t.integer :nb_terraces
      t.integer :nb_balconies
      t.float :surface_living
      t.float :surface_Carrez
      t.float :surface_total
      t.boolean :dpe_done
      t.float :energy_consumption
      t.float :ges_emission

      t.timestamps
    end
  end
end
