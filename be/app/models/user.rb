# frozen_string_literal: true
class User < ApplicationRecord
  include AttributeEncryptable
  has_many :votes, dependent: :destroy
  has_many :links, dependent: :destroy

  has_secure_password

  composed_of :phone_number, mapping: %w(phone_number value)

  validates :name, presence: true
  validates :email, email: true, uniqueness: { case_sensitive: true }, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  # define callbacks by callback_object when loaded
  encrypt_attributes :phone_number
end
