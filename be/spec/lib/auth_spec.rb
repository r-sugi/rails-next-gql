# frozen_string_literal: true
require "rails_helper"

RSpec.describe Auth, type: :model do
  subject(:auth_payload) { "token payload" }

  it "decode token payload matches before encode" do
    token = Auth.issue(auth_payload)
    decoded = Auth.decode(token)
    expect(decoded).to eq auth_payload
  end
end
