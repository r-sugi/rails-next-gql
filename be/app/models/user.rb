# frozen_string_literal: true
class User < ApplicationRecord
  composed_of :phone_number, mapping: %w(phone_number value)
end
