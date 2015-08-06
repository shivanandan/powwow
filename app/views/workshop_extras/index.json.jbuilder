json.array!(@workshop_extras) do |workshop_extra|
  json.extract! workshop_extra, :id, :title, :description, :link
  json.url workshop_extra_url(workshop_extra, format: :json)
end
