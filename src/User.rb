# frozen_string_literal: true

require 'bcrypt'

class User
  include BCrypt
  attr_accessor :userName

  def initialize(user_name, password)
    @user_name = user_name
    @password = BCrypt::Password.create(password)
  end
end
