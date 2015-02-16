class AddConsulateEmailAndConsulatePhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :consulate_email, :string
    add_column :users, :consulate_phone, :string
  end
end
