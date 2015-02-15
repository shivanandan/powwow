class AddSlugToWebpages < ActiveRecord::Migration
  def change
    add_column :webpages, :slug, :string
    add_index :webpages, :slug, unique: true
  end
end
