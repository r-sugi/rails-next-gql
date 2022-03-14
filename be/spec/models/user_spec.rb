# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end
  it 'userインスタンスが有効' do
    expect(@user).to be_valid
  end
end
