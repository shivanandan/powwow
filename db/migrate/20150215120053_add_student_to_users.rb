class AddStudentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :student, :string
  end
end
