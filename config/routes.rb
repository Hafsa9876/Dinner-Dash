Rails.application.routes.draw do
  resources :items
  resources :categories
  resources :orders
  # Add other resources here

  root 'items#index' # Set your root route to an appropriate controller/action
end
