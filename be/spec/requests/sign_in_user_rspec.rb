# frozen_string_literal: true
require "rails_helper"

RSpec.describe "SignInUser", type: :request do
  describe "resolver" do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    def perform(args = {})
      Mutations::SignInUser.new(field: nil, object: nil, context: { session: {} }).resolve(credentials: args[:credentials])
    end

    it "Success" do
      sign_in_user_input = {
        credentials: {
          email: user[:email],
          password: user.password
        }
      }

      res = perform(credentials: sign_in_user_input[:credentials])

      expect(res[:user]).to eq user
      expect(res[:token]).to be_present
    end

    it "failure because no credentials" do
      res = perform

      expect(res).to eq nil
    end

    it "failure because wrong email" do
      res = perform(credentials: { email: "wrong" })
      expect(res).to eq nil
    end

    it "failure because wrong password" do
      res = perform(credentials: { email: other_user[:email], password: "wrong" })

      expect(res).to eq nil
    end
  end
end
