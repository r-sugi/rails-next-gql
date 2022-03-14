# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'CreateUser', type: :request do
  describe 'resolver' do
    it 'userが作成されること' do
      create_user_params = {
        name: 'hoge',
        email: 'sample1@gmail.com'
      }

      mutation = Mutations::CreateUser.new(field: nil, object: nil, context: {})
      res = mutation.resolve(
        name: create_user_params[:name],
        email: create_user_params[:email]
      )
      expect(res[:user][:name]).to eq create_user_params[:name]
      expect(res[:user][:email]).to eq create_user_params[:email]
    end
  end
end
