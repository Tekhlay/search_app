require 'rails_helper'

RSpec.describe SearchController, type: :controller do
    describe 'POST #create' do
        it 'creates a new search query' do
            post :log, params: { query: 'what is' }
            expect(SearchQuery.count).to eq(0)
        end
    end
end