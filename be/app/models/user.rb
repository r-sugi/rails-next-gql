# frozen_string_literal: true
class User < ApplicationRecord
  include AttributeEncryptable
  has_secure_password

  composed_of :phone_number, mapping: %w(phone_number value)

  validates :name, presence: true
  validates :email, email: true, uniqueness: true
  validates :password, format: { with: /\A[\p{ascii}&&[^\x20]]{8,72}\z/, allow_nil: true }

  # define callbacks by callback_object when loaded
  encrypt_attributes :phone_number
end
