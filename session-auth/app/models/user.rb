class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
  has_secure_password

  validates :password, length: { minimum: 6 }
  validates :email, 
  			presence: true, 
  			uniqueness: { case_sensitive: false }, 
  			format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }

  def self.create_with_omniauth(auth)
  	create do |user|
  		user.uid = auth["uid"]
  		user.email = auth["uid"] + "@example.com"
  		user.password = "example1"
  		user.password_confirmation = "example1"
  	end
  end
end
