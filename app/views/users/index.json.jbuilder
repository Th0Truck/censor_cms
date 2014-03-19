json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :password_hash, :password_salt, :uid, :provider, :icon
  json.url user_url(user, format: :json)
end
