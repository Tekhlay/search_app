class SearchController < ApplicationController
  def index
    @search = SearchQuery.all
    # render json: @search
  end

  def create
    @query = params[:query]
    @search = SearchQuery.create(query: @query, ip_address: request.remote_ip)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: @search }
    end
  end
end
