class SearchController < ApplicationController
  protect_from_forgery with: :null_session

  def record_query
    query_text = params[:query]
    user_session = request.session.id

    unless query_text.strip.empty? || query_text.length < 3
      SearchQuery.create(query: query_text, user_session: user_session)
    end

    head :ok
  end

  def show_analytics
    top_searches = SearchQuery.group(:query).order('count_id DESC').limit(10).count(:id)
    
    render json: { top_searches: top_searches }
  end
end
