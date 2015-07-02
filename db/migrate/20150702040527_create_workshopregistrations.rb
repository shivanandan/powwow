class CreateWorkshopregistrations < ActiveRecord::Migration
  def change
    create_table :workshopregistrations do |t|
      t.integer :workshop_id
      t.integer :user_id
      t.integer :position

      t.timestamps
    end
  end
end
