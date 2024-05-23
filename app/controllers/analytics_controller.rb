class AnalyticsController < ApplicationController
  def index
    @unique_queries = SearchQuery.unique_queries
    @top_queries = SearchQuery.top_queries
    @user_searches = SearchQuery.by_ip_address(request.remote_ip)
  end
end
