# frozen_string_literal: true
class Person5
  include ActiveModel::Validations

  attr_accessor :name, :age

  validates :name, presence: true, length: { maximum: 100 }
  validates :age, numericality: { greater_than_or_equal_to: 0 }
end
