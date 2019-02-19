# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many :alpacas }
    it { should have_many(:alpacas).through(:ownerships) }
  end

  it { should validate_uniqueness_of(:email).case_insensitive }
end
