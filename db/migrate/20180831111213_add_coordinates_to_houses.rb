class AddCoordinatesToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :latitude, :float
    add_column :houses, :longitude, :float
  end
end
