# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ownership, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:alpaca) }
  end

  describe 'database_columns' do
    it { is_expected.to have_db_column :user_id }
    it { is_expected.to have_db_column :alpaca_id }
    it { is_expected.to have_db_column :alpaca_id }
  end


end
