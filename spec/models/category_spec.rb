# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { FactoryBot.build(:category) }

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe 'associations' do
    it { should have_many :category_skills }
    it { should have_many :events }
  end

  describe 'db_columns' do
    it { should have_db_column :name }
    it { should have_db_column :description }
  end
end
