json.extract! user, :id, :user_account, :disp_name, :mail, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
