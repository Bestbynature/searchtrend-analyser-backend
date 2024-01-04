Rails.application.routes.draw do
 
  # root "articles#index"
  post '/search', to: 'search#record_query'
  get '/analytics', to: 'search#show_analytics'
end
