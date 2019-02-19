# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AlpacaSkill, type: :model do
  subject { FactoryBot.build(:alpaca_skill) }

  describe 'validations' do
    it { should belong_to :alpaca }
    it { should belong_to :skill }
  end

  describe 'validations' do
    it { should validate_inclusion_of(:level).in_array((1..100).to_a) }
    it { should validate_uniqueness_of(:alpaca_id).scoped_to(:skill_id) }
  end

  describe 'db_columns' do
    it { should have_db_column :alpaca_id }
    it { should have_db_column :skill_id }
    it { should have_db_column :level }
  end
end
