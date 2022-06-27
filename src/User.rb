require 'bcrypt'

class User
    include BCrypt
    
    def initialize(userName, password)
        @userName = userName
        @password = BCrypt::Password.create(password)
    end

end