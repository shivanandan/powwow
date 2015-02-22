class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :title
      t.text :abstract
      t.text :authors
      t.text :co_authors
      t.string :gps
      t.boolean :poster
      t.boolean :previous_attendance
      t.string :attendance_year
      t.boolean :previous_bursary
      t.boolean :bursary
      t.text :reason_for_bursary
      t.integer :user_id

      t.timestamps
    end
  end
end
