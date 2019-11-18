class AuthenticateUser
    prepend SimpleCommand
    attr_accessor :email, :password
  
    #this is where parameters are taken when the command is called
    def initialize(email, password)
      @email = email
      @password = password
    end
    
    #this is where the result gets returned
    def call
      access_token = JsonWebToken.encode(user_id: user.id) if user
      refresh_token = JsonWebToken.encode({user_id: user.id}, 7.hours.from_now) if user
      result = { access_token: access_token, refresh_token: refresh_token }
    end
  
    private
  
    def user
      user = User.find_by_email(email)
      return user if user && user.authenticate(password)
  
      errors.add :user_authentication, 'Invalid credentials'
      nil
    end
  end