class AddStudyingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :studying, :boolean
  end
end
