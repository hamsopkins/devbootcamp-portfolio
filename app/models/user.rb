class User < ActiveRecord::Base
	validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, message: "Please enter a valid email address." }, uniqueness: true
	validates :password, presence: true
  has_many :entries

  def password
  	@password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
  	@password = BCrypt::Password.create(new_password)
  	self.encrypted_password = @password
  end

  def authenticate(password)
  	self.password == password
  end

  def self.authenticate(email, password)
    users = User.where(email: email)
    if users.any?
  		users.first.authenticate(password)
  	else
  		false
  	end
  end
end
