Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/newproduct' => 'products#new'
  post '/product' => 'products#create'



  resources :sessions
  resources :categories
  resources :reviews
  resources :users
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
