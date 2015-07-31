class AddOthersToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :current_seats, :integer
    add_column :workshops, :maximum_seats, :integer
  end
end
