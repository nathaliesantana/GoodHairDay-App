Rails.application.routes.draw do

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/newproduct' => 'products#new'
  post '/products' => 'products#create'

  resources :categories
  resources :reviews
  resources :users
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
