class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :submissions, :gps, :gps_lat
  end
end
