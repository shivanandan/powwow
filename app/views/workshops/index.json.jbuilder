json.array!(@workshops) do |workshop|
  json.extract! workshop, :id, :title, :level, :description, :type, :keywords
  json.url workshop_url(workshop, format: :json)
end
