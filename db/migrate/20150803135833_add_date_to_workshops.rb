class AddDateToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :day, :integer
    add_column :workshops, :time, :string
    add_column :workshops, :duration, :string
  end
end
