# frozen_string_literal: true
require "jwt"

module AuthToken
  module_function

  ALGORITHM = "HS256"

  def issue(payload)
    JWT.encode(
      payload,
      auth_secret,
      ALGORITHM)
  end

  def decode(token)
    JWT.decode(token,
      auth_secret,
      true,
      { algorithm: ALGORITHM }).first
  end

  def auth_secret
    ENV["AUTH_SECRET"]
  end

  def user_from_token(http_authorization)
    if auth_present?(http_authorization)
      raw_token = decode(token(http_authorization))
      User.find(raw_token["user"])
    end
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      nil
  end

  def auth_present?(http_authorization)
    !!http_authorization.scan(/Bearer/).flatten.first
  end

  def token(http_authorization)
    http_authorization.scan(/Bearer (.*)$/).flatten.last
  end
end
