# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    name { "sample_name" }
    email { "sample@gmail.com" }
  end
end
