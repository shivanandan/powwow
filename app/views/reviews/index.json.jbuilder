json.array!(@reviews) do |review|
  json.extract! review, :id, :submission_id, :user_id, :conservation_score, :science_score, :visual_score, :recommendation, :comment_to_applicant, :comment_to_admin, :finalized, :view_count
  json.url review_url(review, format: :json)
end
