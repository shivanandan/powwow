class AddWorkshopIdToWorkshopExtras < ActiveRecord::Migration
  def change
    add_column :workshop_extras, :workshop_id, :integer
  end
end
