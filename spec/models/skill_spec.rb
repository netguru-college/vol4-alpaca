# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Skill, type: :model do
  subject { FactoryBot.build(:skill) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should validate_uniqueness_of(:description).case_insensitive }
  it { should have_many :alpaca_skills }
  it { should have_many(:alpacas).through :alpaca_skills }
  it { should have_many(:categories).through(:category_skills)}
end
