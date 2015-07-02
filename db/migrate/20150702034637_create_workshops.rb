class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :title
      t.string :level
      t.text :description
      t.string :type
      t.string :keywords

      t.timestamps
    end
  end
end
