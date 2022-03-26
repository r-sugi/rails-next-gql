# frozen_string_literal: true
require "rails_helper"

RSpec.describe AuthToken, type: :model do
  subject(:auth_payload) { "token payload" }

  it "decode token payload matches before encode" do
    token = AuthToken.issue(auth_payload)
    decoded = AuthToken.decode(token)
    expect(decoded).to eq auth_payload
  end
end
