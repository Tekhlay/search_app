class SearchQuery < ApplicationRecord
    validates :query, presence: true
    validates :ip_address, presence: true

    scope :unique_queries, -> { select('DISTINCT query').count }
    scope :top_queries, -> (limit = 10) { group(:query).order('count_id DESC').limit(limit).count('id') }
    scope :by_ip_address, -> (ip_address) { where(ip_address: ip_address) }
end
