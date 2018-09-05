class AddExclusiveToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :exclusive, :boolean
  end
end
