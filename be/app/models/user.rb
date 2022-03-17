# frozen_string_literal: true
class User < ApplicationRecord
  has_secure_password

  composed_of :phone_number, mapping: %w(phone_number value)

  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, format: { with: /\A[\p{ascii}&&[^\x20]]{8,72}\z/, allow_nil: true }
end
