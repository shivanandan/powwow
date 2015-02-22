class AddGpsLngToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :gps_lng, :string
  end
end
