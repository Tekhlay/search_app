class SearchController < ApplicationController
  def index
    @search_queries = SearchQuery.all
  end

  def create
    @query = params[:query]
    @search_query = SearchQuery.create(query: @query, ip_address: request.remote_ip)

    respond_to do |format|
      format.js { render partial: 'search/search_results', locals: { query: @query } }
      format.html { redirect_to root_path }
      format.json { render json: @search_query }
    end
  end
end
