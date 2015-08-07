json.array!(@conferences) do |conference|
  json.extract! conference, :id, :workshop_registration_flag, :workshop_close_flag
  json.url conference_url(conference, format: :json)
end
