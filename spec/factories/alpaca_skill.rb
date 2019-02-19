# frozen_string_literal: true

FactoryBot.define do
  factory :alpaca_skill do
    level { 1 }
    skill
    alpaca
  end
end
