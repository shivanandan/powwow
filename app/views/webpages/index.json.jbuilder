json.array!(@webpages) do |webpage|
  json.extract! webpage, :id, :title, :body
  json.url webpage_url(webpage, format: :json)
end
