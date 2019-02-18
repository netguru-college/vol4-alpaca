require 'rails_helper'

RSpec.describe Alpaca, type: :model do
  subject {described_class.create}


  it {should validate_presence_of :name}
  it {should validate_presence_of :quote}
  it {should validate_presence_of :picture_url}
  # This should be uncommented, when Skills model will be created.
  #it {should have_many(:skills).through(:alpaca_skills)
  describe 'associations' do
    it { should have_many :ownerships }
    it { should have_many(:users).through(:ownerships) }
   # it { should have_many(:users).through(:ownerships) }
  end



  # Not sure, if those tests are necessary...
  it 'is not expected to have blank name' do
    expect(subject.name).to_not be nil
  end

  it 'is not expected to have blank quote' do
    expect(subject.quote).to_not be nil
  end

  it 'is not expected to have blank picture_url' do
    expect(subject.picture_url).to_not be nil
  end
end
