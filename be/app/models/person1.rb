# frozen_string_literal: true
class Person1
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :age, :integer
end
