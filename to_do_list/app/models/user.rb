class User < ApplicationRecord
  validates :name, presence: true, length: {maximum:20}, uniqueness: { case_sensitive: false  }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 30},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 5}
  has_secure_password
end
