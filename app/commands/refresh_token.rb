class RefreshToken
  prepend SimpleCommand

  #this is where parameters are taken when the command is called
  def initialize(refresh_token)
    @refresh_token = refresh_token
  end
  
  
  #this is where the result gets returned
  def call
    access_token = JsonWebToken.encode(user_id: user_id) if user_id
    refresh_token = JsonWebToken.encode({user_id: user_id}, 7.hours.from_now) if user_id
    result = { access_token: access_token, refresh_token: refresh_token }
  end

  private

  def user_id
    begin
      data = JsonWebToken.decode(@refresh_token)
      user_id = data[:user_id]
    rescue StandardError => e
      errors.add :token_authentication, 'Invalid or expired token'
      return nil
    end
  end
end