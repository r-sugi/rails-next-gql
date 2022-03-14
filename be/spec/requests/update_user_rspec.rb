# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'UpdateUser', type: :request do
  describe 'resolver' do
    it 'userが作成されること' do
      user = create(:user)
      create_user_params = {
        id: user[:id],
        name: 'hoge2',
        email: 'sample2@gmail.com'
      }
      mutation = Mutations::UpdateUser.new(field: nil, object: nil, context: {})
      res = mutation.resolve(
        id: create_user_params[:id],
        name: create_user_params[:name],
        email: create_user_params[:email]
      )
      expect(res[:user][:id]).to eq create_user_params[:id]
      expect(res[:user][:name]).to eq create_user_params[:name]
      expect(res[:user][:email]).to eq create_user_params[:email]
    end
  end
end
