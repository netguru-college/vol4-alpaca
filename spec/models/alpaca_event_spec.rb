require 'rails_helper'

RSpec.describe AlpacaEvent, type: :model do
  describe 'associations' do
    it { should belong_to :alpaca }
    it { should belong_to :event }
  end
end
