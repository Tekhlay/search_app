class SearchController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:log]

  def index
    @search_queries = SearchQuery.all
  end

  def log
    query = params[:query].strip
    ip_address = request.remote_ip

    if meaningful_query?(query)
      SearchQuery.create(query: query, ip_address: ip_address)
      render json: { success: true }
    else
      render json: { success: false, error: 'Incomplete or meaningless query' }, status: :unprocessable_entity
    end
  end

  private

  def meaningful_query?(query)
    return false if query.blank?

    stop_words = %w(a an the and or)
    words = query.split
    known_verbs = %w(is are was were do does has have had be being been)
    filtered_words = words - stop_words
    has_multiple_words = filtered_words.size > 1

    has_verbs = filtered_words.any? { |word| known_verbs.include?(word.downcase) }

    has_nouns = filtered_words.any? { |word| word.match(/\w+/) && !known_verbs.include?(word.downcase) }

    
    has_multiple_words && has_verbs && has_nouns
  end
end
