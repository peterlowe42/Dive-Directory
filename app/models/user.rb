require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :reviews

  validates :username, { presence: :true, uniqueness: :true }
  validates :email, { presence: :true, uniqueness: :true }
  validates :password_hash, { presence: true }

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = self.find_by(email: email)
    if user == nil
      false
    elsif user.password == password
      user
    else
      false
    end
  end
  
end