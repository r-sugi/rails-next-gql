# frozen_string_literal: true
class User < ApplicationRecord
  validates :phone_number, format: { with: /¥A0¥d{9,10}¥z/ }

  def mobile_phone_number?
    phone_number.match?(/¥A0[7-9]0¥d{8}¥z/)
  end
end
