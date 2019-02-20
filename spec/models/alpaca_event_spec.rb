# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AlpacaEvent, type: :model do
  describe 'associations' do
    it { should belong_to :alpaca }
    it { should belong_to :event }
  end

  describe 'db_columns' do
    it { should have_db_column :alpaca_id }
    it { should have_db_column :event_id }
    it { should have_db_column :winner }

  end
end
