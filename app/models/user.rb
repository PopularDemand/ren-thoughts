class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 150 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: {minimum: 7 }

  # This adds:
  # The ability to save a securely hashed password_digest attribute to the database
  # A pair of virtual attributes (password and password_confirmation), including presence validations upon object creation and a validation requiring that they match
  # An authenticate method that returns the user when the password is correct (and false otherwise)
  # corresponding model must have an attribute called password_digest in table
  has_secure_password
end
