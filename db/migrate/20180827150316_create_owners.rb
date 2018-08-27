class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :phone_number
      t.string :address
      t.date :birth_date
      t.string :birth_place
      t.boolean :is_business
      t.string :company_name
      t.string :siret_number
      t.string :rcs_number
      t.string :hq_address

      t.timestamps
    end
  end
end
