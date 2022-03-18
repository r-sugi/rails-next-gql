# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "AttributeEncryptable", type: :model do
  before do
    @attribute = :phone_number
    @callbacks = AttributeEncryptable::Callbacks.new(@attribute)
    @raw_value = "07011112222"
  end

  it "should encrypt the specified attribute" do
    # rubocop:disable RSpec/VerifiedDoubles
    mock_record = spy("record")

    @callbacks.before_save(mock_record)

    expect(mock_record).to have_received(:[]).with(@attribute)
    expect(mock_record).to have_received(:[]=).with(@attribute, /\A[A-Za-z0-9+\/]+={,2}--.+\z/)
  end

  it "should decrypt the specified attribute" do
    encrypted = { @attribute => @raw_value }.tap(&@callbacks.method(:before_save))[@attribute]

    %i[after_find after_save].each do |callback|
      mock_record = instance_double("record")
      allow(mock_record).to receive(:[]).with(@attribute).and_return(encrypted)
      allow(mock_record).to receive(:[]=).with(@attribute, @raw_value).and_return(nil)

      @callbacks.public_send(callback, mock_record)

      expect(mock_record).to have_received(:[]).with(@attribute)
      expect(mock_record).to have_received(:[]=).with(@attribute, @raw_value)
    end
  end
end
