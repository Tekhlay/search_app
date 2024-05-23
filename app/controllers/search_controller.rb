class SearchController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:log]
  def index
    @search_queries = SearchQuery.all
  end

  def log
    query = params[:query].strip
    ip_address = request.remote_ip

    unless query.empty?
      SearchQuery.create(query: query, ip_address: ip_address)
      render json: { success: true }
    else
      render json: { success: false, error: 'Empty query' }, status: :unprocessable_entity
    end
  end
end
