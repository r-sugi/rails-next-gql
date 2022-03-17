# frozen_string_literal: true
class User < ApplicationRecord
  has_secure_password

  composed_of :phone_number, mapping: %w(phone_number value)

  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, format: { with: /\A[\p{ascii}&&[^\x20]]{8,72}\z/, allow_nil: true }
  validates :terms_of_service, acceptance: true

  after_create_commit :send_welcome_email

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_later
  end
end
