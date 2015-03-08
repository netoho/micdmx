json.array!(@profiles) do |profile|
  json.extract! profile, :id, :profile
  json.url profile1_url(profile, format: :json)
end
