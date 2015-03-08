json.array!(@statuses) do |status|
  json.extract! status, :id, :name, :status_type
  json.url status_url(status, format: :json)
end
