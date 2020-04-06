Rails.application.routes.draw do

  root 'sessions#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/facebook/callback' => 'users#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  delete '/logout' => 'sessions#destroy'

  resources :sessions
  resources :categories
  resources :reviews
  resources :users
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
