class User < ApplicationRecord
  has_secure_password
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  normalizes :email, with: ->(email) { email.strip.downcase }

  generates_token_for :password_reset, expires_in: 10.minutes do
    password_salt&.last(10)
  end

  generates_token_for :email_confirmation, expires_in: 6.hours do
    email
  end
end
