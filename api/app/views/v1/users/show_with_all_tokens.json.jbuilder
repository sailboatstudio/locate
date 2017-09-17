json.partial! "v1/users/user", user: @current_user
json.partial! "v1/sessions/auth_token", user: @current_user
json.partial! "v1/sessions/refresh_token", user: @current_user
