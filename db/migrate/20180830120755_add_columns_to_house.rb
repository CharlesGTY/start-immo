class AddColumnsToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :tenant, :boolean
    add_column :houses, :construction_date, :integer
    add_column :houses, :condo, :boolean
    add_column :houses, :number_of_lot, :integer
    add_column :houses, :current_procedure, :boolean
    add_column :houses, :particular_information, :text
    add_column :houses, :surface_terrace, :float
    add_monetize :houses, :charges, currency: { present: false }
    add_monetize :houses, :property_taxes, currency: { present: false }
    add_monetize :houses, :agence_fee, currency: { present: false }
    add_monetize :houses, :net_price_seller, currency: { present: false }
    add_monetize :houses, :annual_charges, currency: { present: false }
  end
end
