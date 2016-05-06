require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  attr_accessor :password_confirmation, :password, :activation_token

  has_many :reviews

  validates :username, { presence: :true, uniqueness: :true }
  validates :email, { presence: :true, uniqueness: :true }
  validates :password_hash, { presence: true }
  validates_confirmation_of :password 
  
  before_create :create_activation_digest
  before_save :downcase_email

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

  private 

  def downcase_email
    self.email = self.email.downcase
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end