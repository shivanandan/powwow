class AddAbstractSubmittedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :abstract_submitted, :boolean
  end
end
