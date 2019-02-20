# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategorySkill, type: :model do
  subject { FactoryBot.build(:category_skill) }

  describe 'validations' do
    it { should validate_numericality_of(:weight).is_greater_than(0) }
  end

  describe 'associations' do
    it { should belong_to :skill }
    it { should belong_to :category }
  end

  describe 'db_columns' do
    it { should have_db_column :skill_id }
    it { should have_db_column :weight }
  end
end
