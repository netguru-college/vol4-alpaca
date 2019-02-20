# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'MyString' }
    description { 'MyString' }
    bid { [1..10_000].to_a.sample }
    category

  end
end
