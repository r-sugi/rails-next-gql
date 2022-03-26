# frozen_string_literal: true
class ValidationError < GraphQL::ExecutionError
  attr_reader :attribute
  CODE = "INVALID_INPUT"

  def initialize(message:, attribute:)
    super(message)
    @attribute = attribute
  end

  def to_h
    super.merge({ "extensions" => { "code" => CODE, attribute: @attribute } })
  end
end
