require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'UsersResolver' do
    it 'usersが取得できること' do

      user1 = create(:user)
      user2 = create(:user)
      resolver = Resolvers::UsersResolver.new(field: nil, object: nil, context:{})
      ret = resolver.resolve
      expect(ret).to eq [user1, user2]
    end
  end
end
