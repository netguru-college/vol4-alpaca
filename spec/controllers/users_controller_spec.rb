# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'user#show' do
    let(:user) { create :user }
    it 'return 200' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'user#index' do
    it 'return 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
