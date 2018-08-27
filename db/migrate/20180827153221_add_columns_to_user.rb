class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :agence, :string
    add_reference :users, :agence, foreign_key: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :attes_collab_number, :string
    add_column :users, :attes_collab_number_date, :string
    add_column :users, :attes_collab_number_city, :string
  end
end
