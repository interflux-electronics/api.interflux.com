# This service is responsible for encoding and decoding JSON web tokens (JWT)
#
# Usage:
# data = { user_id: @user.id }
# encoded_data = JsonWebToken.new(data).encode
# decoded_data = JsonWebToken.new(encoded_data).decode
#
# Inspired from:
# https://medium.com/binar-academy/rails-api-jwt-authentication-a04503ea3248
#
class JsonWebToken
  def initialize(data, exp = 24.hours.from_now)
    @data = data
    @exp = exp
  end

  def encode
    @data[:exp] = @exp.to_i
    JWT.encode(@data, jwt_secret)
  end

  def decode
    decoded = JWT.decode(@data, jwt_secret)[0]
    HashWithIndifferentAccess.new decoded
  end

  private

  def jwt_secret
    ENV.fetch('JWT_SECRET')
  end
end