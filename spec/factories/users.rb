# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@factory.com" }
    password { Faker::Internet.password }
  end
end
