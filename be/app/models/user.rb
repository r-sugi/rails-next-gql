# frozen_string_literal: true
class User < ApplicationRecord
  def phone_number
    @phone_number ||= PhoneNumber.new(self[:phone_number])
  end

  def phone_number=(new_phone_number)
    self[:phone_number] = new_phone_number
    @phone_number = new_phone_number
  end
end
