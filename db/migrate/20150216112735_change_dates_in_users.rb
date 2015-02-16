class ChangeDatesInUsers < ActiveRecord::Migration
  def change
  	change_column :users, :passport_date_of_issue, :date
  	change_column :users, :passport_date_of_expiry, :date
  end
end