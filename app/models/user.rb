require 'bcrypt'

class User
  include Mongoid::Document

  attr_accessor :password

  field :username, type: String
  field :salt, type: String
  field :hashed_password, type: String

  validates :username, presence: true, uniqueness: true

  def authenticated? pwd
  	self.hashed_password == BCrypt::Engine.hash_secret(pwd, self.salt)
  	# replace "self.hashed_password" with BCrypt::Password.????
  	# @password = BCrypt::Password.new(pwd)
  end

  before_save :hash_stuff

  private
  	def hash_stuff
  		self.salt = BCrypt::Engine.generate_salt
  		self.hashed_password = BCrypt::Engine.hash_secret self.password, self.salt
  		self.password = nil
  	end

end
