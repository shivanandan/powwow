class CreateWorkshopExtras < ActiveRecord::Migration
  def change
    create_table :workshop_extras do |t|
      t.string :title
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
