Rails.application.routes.draw do
  get 'order/index'
  get 'order/show'
  get 'order/new'
  get 'order/edit'
  get 'order/create'
  get 'order/update'
  get 'order/destroy'
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
