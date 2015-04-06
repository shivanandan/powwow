class AddDefaultValuesToReviews < ActiveRecord::Migration
  def up
	  change_column :reviews, :conservation_score, :integer, :default => 0
	  change_column :reviews, :science_score, :integer, :default => 0
	  change_column :reviews, :visual_score, :integer, :default => 0
	  change_column :reviews, :view_count, :integer, :default => 0
	  change_column :reviews, :recommendation, :string, :default => 'denied'

	end

	def down
	  change_column :reviews, :conservation_score, :integer, :default => nil
	  change_column :reviews, :science_score, :integer, :default => nil
	  change_column :reviews, :visual_score, :integer, :default => nil
	  change_column :reviews, :view_count, :integer, :default => nil
	  change_column :reviews, :recommendation, :string, :default => nil
	end
end
