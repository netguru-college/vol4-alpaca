# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Alpaca, type: :model do
  subject { FactoryBot.build(:alpaca) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :quote }
  it { should validate_presence_of :picture_url }

  describe 'associations' do
    it { should have_many :alpaca_skills }
    it { should have_many(:skills).through :alpaca_skills }
    it { should have_many :ownerships }
    it { should have_many(:users).through(:ownerships) }
  end
end
