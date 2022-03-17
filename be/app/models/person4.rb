# frozen_string_literal: true
class Person4
  include ActiveModel::Serializers::JSON

  attr_accessor :name, :age

  def attributes
    { name: name, age: age }
  end
end
