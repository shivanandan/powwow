class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :plenary
      t.text :scheduling
      t.text :scheduling_comments
      t.text :plenary_topic1
      t.text :plenary_topic2
      t.text :plenary_topic3
      t.text :workshop_topic1
      t.text :workshop_topic2
      t.text :workshop_topic3
      t.text :food
      t.text :overall_rating
      t.text :overall_suggestions
      t.text :compare
      t.text :additional_comments

      t.timestamps
    end
  end
end
