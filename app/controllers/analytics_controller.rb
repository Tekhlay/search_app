class AnalyticsController < ApplicationController
  def index
    @search_queries = SearchQuery.group(:query).count
    @ip_addresses = SearchQuery.group(:ip_address).count
  end
end
