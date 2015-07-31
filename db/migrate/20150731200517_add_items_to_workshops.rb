class AddItemsToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :max_seats, :string
  end
end
