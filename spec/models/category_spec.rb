require 'rails_helper'

RSpec.describe Category, type: :model do

  subject {FactoryBot.build(:category)}

  it {should validate_presence_of :name}
  it {should validate_presence_of :description}


  describe 'associations' do
    it {should have_many :category_skills}
    it {should have_many :events}



  end
end
