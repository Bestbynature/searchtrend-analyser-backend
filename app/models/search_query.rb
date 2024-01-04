class SearchQuery < ApplicationRecord
  validates :query, presence: true
  validates :user_session, presence: true

  def self.filter_and_store(query_text, user_session)
    return if query_text.strip.length < 3
    existing_query = find_by(query: query_text, user_session: user_session)
    create(query: query_text, user_session: user_session) unless existing_query
  end
end