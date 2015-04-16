class AddEditableToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :editable, :boolean
  end
end
