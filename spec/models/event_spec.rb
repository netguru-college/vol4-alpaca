# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { FactoryBot.build(:event) }

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe 'associations' do
    it { should have_many :alpaca_events }
    it { should have_many(:alpacas).through :alpaca_events }
    it { should belong_to :category }


  end

  describe 'db_columns' do
    it { should have_db_column :name }
    it { should have_db_column :description }
    it { should have_db_column :bid }
  end
end
