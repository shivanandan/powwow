class ChangePosterFormatInSubmissions < ActiveRecord::Migration
  def change
  	change_column :submissions, :poster, :string
  end
end
