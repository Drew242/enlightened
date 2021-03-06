Rails.application.routes.draw do
  root                            to: 'welcome#index'
  get '/dashboard',               to: 'dashboard#show'
  get '/auth/facebook/callback',  to: 'sessions#create'
  get '/auth/twitter/callback',   to: 'sessions#create'
  get '/logout',                  to: 'sessions#destroy'
  get '/search',                  to: 'dashboard#search'
  post '/articles/create',        to: 'articles#create'
  resources :articles, only: [:show, :update, :destroy]
end
