# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    sequence(:id) {|n| n }
    name { "sample_name" }
    sequence(:email) {|n| "sample_#{n}@gmail.com" }
    phone_number { PhoneNumber.new("09011112222") }
    password { "test_password" }
    terms_of_service { nil }
  end
end
