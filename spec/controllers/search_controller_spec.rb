require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'POST #log' do
    it 'does not create a new search query for an incomplete query' do
      post :log, params: { query: 'what is' }
      expect(SearchQuery.count).to eq(0)
    end

    it 'creates a new search query for a complete query' do
      post :log, params: { query: 'What is a good car' }
      expect(SearchQuery.count).to eq(1)
    end

    it 'does not create a new search query for an empty query' do
      post :log, params: { query: '' }
      expect(SearchQuery.count).to eq(0)
    end

    it 'returns success for a complete query' do
      post :log, params: { query: 'How is emil hajric doing' }
      expect(response).to have_http_status(:success)
    end

    it 'returns error for an incomplete query' do
      post :log, params: { query: 'How is' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
