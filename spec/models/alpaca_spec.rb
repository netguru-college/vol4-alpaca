# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Alpaca, type: :model do
  subject { FactoryBot.build(:alpaca) }

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :quote }
    it { should validate_presence_of :picture_url }
  end

  describe 'associations' do
    it { should have_many :alpaca_skills }
    it { should have_many(:skills).through :alpaca_skills }
    it { should have_many :ownerships }
    it { should have_many(:users).through(:ownerships) }
  end

  describe 'db_columns' do
    it { should have_db_column :name }
    it { should have_db_column :quote }
    it { should have_db_column :picture_url }
    it { should have_db_column :gender }
    it { should have_db_column :for_sale }
    it { should have_db_column :busy }
  end
end
