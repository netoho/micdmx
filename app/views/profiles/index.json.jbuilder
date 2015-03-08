json.array!(@profile1s) do |profile1|
  json.extract! profile1, :id, :profile
  json.url profile1_url(profile1, format: :json)
end
