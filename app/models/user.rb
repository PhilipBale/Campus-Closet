class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 75 }
  VALID_EMAIL_REGEX = /[\w]+@gatech.edu/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :phone, presence: true, length: { maximum: 15 }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
