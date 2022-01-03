Rails.application.routes.draw do
  resources :phrases
  post '/entities/learn', to: 'entities#learn'
  post '/entities/similar', to: 'entities#similar'
  get '/articles', to: 'entities#articles'
  get '/words', to: 'entities#words'
  get '/words_de', to: 'entities#words_de'
  get '/phrases/parse/:page', to: 'phrases#parse'
  resources :entities
  root to: 'entities#index'
end
