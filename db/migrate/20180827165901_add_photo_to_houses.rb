class AddPhotoToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :photo, :string
  end
end

