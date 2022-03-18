# frozen_string_literal: true
class Person6
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  attr_accessor :name

  before_validation :normalize_name, if: -> { name.present? }

  private

    def normalize_name
      self.name = name.downcase.titleize
    end
end
