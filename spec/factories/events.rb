FactoryBot.define do
  factory :event do
    name { "MyString" }
    description { "MyString" }
    bid { [1..10000].to_a.sample }
  end
end
