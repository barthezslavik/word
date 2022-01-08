Rails.application.routes.draw do
  get '/phrases/done', to: 'phrases#done'
  resources :phrases
  post '/entities/learn', to: 'entities#learn'
  post '/entities/similar', to: 'entities#similar'
  post '/phrases/similar', to: 'phrases#similar'
  post '/phrases/unlearn', to: 'phrases#unlearn'
  get '/articles', to: 'entities#articles'
  get '/words', to: 'entities#words'
  get '/words_de', to: 'entities#words_de'
  get '/phrases_en/:category', to: 'entities#phrases_en'
  get '/phrases_de/:category', to: 'entities#phrases_de'
  get '/phrases_en', to: 'entities#phrases_en'
  get '/phrases_de', to: 'entities#phrases_de'
  get '/phrases/parse/:page', to: 'phrases#parse'
  get '/repeat_en', to: 'phrases#repeat_en'
  get '/repeat_de', to: 'phrases#repeat_de'
  resources :entities
  root to: 'entities#index'
end
