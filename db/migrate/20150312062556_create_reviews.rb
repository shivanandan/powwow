class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :submission_id
      t.string :user_id
      t.integer :conservation_score
      t.integer :science_score
      t.integer :visual_score
      t.string :recommendation
      t.text :comment_to_applicant
      t.text :comment_to_admin
      t.boolean :finalized
      t.integer :view_count

      t.timestamps
    end
  end
end
