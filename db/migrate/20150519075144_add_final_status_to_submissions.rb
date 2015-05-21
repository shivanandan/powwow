class AddFinalStatusToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :final_status, :string
  end
end
