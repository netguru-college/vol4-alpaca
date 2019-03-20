require 'rails_helper'

RSpec.describe UserDecorator do
  let(:user) { FactoryBot.build(:user, hay: 200)}
  let(:decorator) {user.decorate}

  context 'User has no name' do
    it "should return User's fortune" do
      expect(decorator.fortune).to eq ("User's fortune: 200")
    end
  end

  context 'User has name' do
    before do
      user.name = 'John'
    end
    it "should return John's fortune" do
      expect(decorator.fortune).to eq("John's fortune: 200")
    end
  end
end
