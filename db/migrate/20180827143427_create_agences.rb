class CreateAgences < ActiveRecord::Migration[5.2]
  def change
    create_table :agences do |t|
      t.string :enseigne_name
      t.string :social_denomination
      t.string :juridic_form
      t.string :email
      t.string :phone_number
      t.string :fax
      t.string :address
      t.string :city
      t.string :director_first_name
      t.string :director_last_name
      t.integer :director_card_number
      t.date :director_card_date
      t.string :director_card_city
      t.string :vat_number
      t.string :siren_number
      t.string :insurance_number
      t.string :social_capital
      t.string :professional_card_mention
      t.string :civil_respons_insurance_name
      t.string :civil_respons_insurance_address
      t.string :civil_respons_police_number
      t.string :civil_respons_police_geo_zone

      t.timestamps
    end
  end
end
