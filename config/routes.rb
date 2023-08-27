Rails.application.routes.draw do
  resources :items
  resources :categories
  resources :orders
  # Add other resources here

  # Users routes
  resources :users

  # Sessions routes
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  root 'items#index' # Set your root route to an appropriate controller/action
end
