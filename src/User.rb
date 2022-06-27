require 'bcrypt'

class User
    include BCrypt
    attr_accessor :userName
    
    def initialize(userName, password)
        @userName = userName
        @password = BCrypt::Password.create(password)
    end

end