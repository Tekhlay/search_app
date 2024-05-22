class SearchController < ApplicationController
  def index
    @search = SearchQuery.all
    render json: @search
  end

  def create
    @search = SearchQuery.new(search_params)

    if @search.save
      redirect_to @search
    else
      render 'new'
    end
  end
end
