json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :address, :gender, :facebook, :twitter, :zip, :birthday, :status_id, :name, :image
  json.url user_url(user, format: :json)
end
