require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { FactoryBot.build(:event) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }

  describe 'associations' do
    it { should have_many :alpaca_events }
    it { should have_many(:alpacas).through :alpaca_events }
    it { should belong_to :categories }
  end
end
