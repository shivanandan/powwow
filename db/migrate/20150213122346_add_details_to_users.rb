class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nationality, :string
    add_column :users, :middle_name, :string
    add_column :users, :gender, :string
    add_column :users, :title, :string
    add_column :users, :institutional_affiliation, :text
    add_column :users, :phone, :string
    add_column :users, :address, :text
    add_column :users, :pio, :string
    add_column :users, :oci, :string
    add_column :users, :guardian_names, :text
    add_column :users, :date_of_birth, :string
    add_column :users, :place_of_birth, :string
    add_column :users, :passport_number, :string
    add_column :users, :passport_place, :string
    add_column :users, :passport_date_of_issue, :string
    add_column :users, :passport_place_of_issue, :string
    add_column :users, :passport_date_of_expiry, :string
    add_column :users, :address_as_stated_in_your_passport, :text
    add_column :users, :indian_consulate, :text
  end
end
