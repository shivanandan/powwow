class CreateWebpages < ActiveRecord::Migration
  def change
    create_table :webpages do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
