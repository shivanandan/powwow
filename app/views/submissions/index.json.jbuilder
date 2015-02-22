json.array!(@submissions) do |submission|
  json.extract! submission, :id, :title, :abstract, :authors, :co_authors, :gps, :poster, :previous_attendance, :attendance_year, :previous_bursary, :bursary, :reason_for_bursary, :user_id
  json.url submission_url(submission, format: :json)
end
