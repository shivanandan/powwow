json.array!(@announcements) do |announcement|
  json.extract! announcement, :id, :title, :message, :date, :priority
  json.url announcement_url(announcement, format: :json)
end
