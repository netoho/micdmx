json.array!(@project_types) do |project_type|
  json.extract! project_type, :id, :project_type, :status_id
  json.url project_type1_url(project_type, format: :json)
end
