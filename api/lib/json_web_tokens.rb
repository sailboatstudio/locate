require 'jwt'

class JsonWebToken
  def self.encode( payload, *expiry )
    if expiry[0] && expiry[0]['expires']
      if expiry[0]['time']
        payload['exp'] = expiry
      else
        payload['exp'] = 20.minutes.from_now.to_i
      end
    end

    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS512')
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.secrets.secret_key_base)[0])
  end
end
