class AddMothersNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mothers_name, :string
  end
end
