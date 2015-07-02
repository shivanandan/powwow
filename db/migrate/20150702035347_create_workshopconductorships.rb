class CreateWorkshopconductorships < ActiveRecord::Migration
  def change
    create_table :workshopconductorships do |t|
      t.integer :workshop_id
      t.integer :user_id
      t.integer :position

      t.timestamps
    end
  end
end
