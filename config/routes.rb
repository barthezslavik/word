Rails.application.routes.draw do
  post '/entities/learn', to: 'entities#learn'
  get '/articles', to: 'entities#articles'
  get '/words', to: 'entities#words'
  get '/words_de', to: 'entities#words_de'
  resources :entities
  root to: 'entities#index'
end
