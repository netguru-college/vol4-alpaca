FactoryBot.define do
  factory :category_skill do
    skill
    category
    weight { Faker::Number.number(1).to_i }
  end
end
