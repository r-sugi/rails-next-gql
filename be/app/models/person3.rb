# frozen_string_literal: true
class Person3
  include ActiveModel::Serialization

  attr_accessor :name, :age

  def attributes
    { name: name, age: age }
  end

  def to_xml(options = nil)
    # refer to attributes method
    serializable_hash(options).to_xml(camelize: :lower, root: self.class.name)
  end
end
