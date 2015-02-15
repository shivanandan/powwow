class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :message
      t.string :date
      t.integer :priority

      t.timestamps
    end
  end
end
