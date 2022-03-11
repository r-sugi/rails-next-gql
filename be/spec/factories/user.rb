# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    name { "sample_name" }
    email { "sample@gmail.com" }
  end
end
