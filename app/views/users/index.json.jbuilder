json.array!(@users) do |user|
  json.extract! user, :email, :password_hash, :password_salt, :is_locked, :last_login_at, :last_login_ip
  json.url user_url(user, format: :json)
end