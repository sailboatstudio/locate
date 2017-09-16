json.refresh_token JsonWebToken.encode(
  { token: user.find_or_create_refresh_token['token'] },
  { expires: false }
)
