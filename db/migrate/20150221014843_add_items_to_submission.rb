class AddItemsToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :introduction, :text
    add_column :submissions, :methods, :text
    add_column :submissions, :results, :text
    add_column :submissions, :discussion, :text
  end
end
