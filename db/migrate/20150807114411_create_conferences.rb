class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.boolean :workshop_registration_flag
      t.boolean :workshop_close_flag

      t.timestamps
    end
  end
end
