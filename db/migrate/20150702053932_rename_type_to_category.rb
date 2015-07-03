class RenameTypeToCategory < ActiveRecord::Migration
  def change
    rename_column :workshops, :type, :category
  end
end
