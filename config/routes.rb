Rails.application.routes.draw do
  post '/entities/learn', to: 'entities#learn'
  resources :entities
  root to: 'entities#index'
end
