json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :plenary, :scheduling, :scheduling_comments, :plenary_topic1, :plenary_topic2, :plenary_topic3, :workshop_topic1, :workshop_topic2, :workshop_topic3, :food, :overall_rating, :overall_suggestions, :compare, :additional_comments
  json.url feedback_url(feedback, format: :json)
end
