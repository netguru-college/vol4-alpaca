require 'rails_helper'

RSpec.describe Alpaca, type: :model do
  subject { described_class.create }

  it { should validate_presence_of :name }
  it { should validate_presence_of :quote }
  it { should validate_presence_of :picture_url }
  it { should have_many :alpaca_skills }
  it { should have_many(:skills).through :alpaca_skills }
end
