require "bcrypt"

class Usuario < ApplicationRecord
  has_secure_password
  validates :nome_completo, presence: true, length: {maximum: 50}
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
  before_save { self.email = email.downcase }
  validates_uniqueness_of :email
end
