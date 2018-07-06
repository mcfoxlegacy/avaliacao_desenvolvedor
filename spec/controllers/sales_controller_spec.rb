require 'rails_helper'

describe SalesController do
  describe 'GET Index Page' do
    it 'return success' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET New Page' do
    it 'return success' do
      get :new
      expect(response.status).to eq(200)
    end
  end
end
