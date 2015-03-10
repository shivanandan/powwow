class AddStartDateAndEndDateToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :start_date, :string
    add_column :announcements, :end_date, :string
  end
end
