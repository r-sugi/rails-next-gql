# frozen_string_literal: true
require "rails_helper"

RSpec.describe "CreateUser", type: :request do
  describe "resolver" do
    def perform(args = {})
      Mutations::CreateUser.new(field: nil, object: nil, context: {})
    end

    it "userが作成されること" do
      create_user_params = {
        name: "hoge",
        auth_provider: {
          credentials: {
            email: "sample1@gmail.com",
            password: "hogehoge"
          }
        }
      }

      res = perform.resolve(
        name: create_user_params[:name],
        auth_provider: create_user_params[:auth_provider]
      )

      expect(res[:user][:name]).to eq create_user_params[:name]
      expect(res[:user][:email]).to eq create_user_params[:auth_provider][:credentials][:email]
    end
  end
end
