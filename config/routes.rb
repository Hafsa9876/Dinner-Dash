Rails.application.routes.draw do

  get 'carts/show'
  resources :items do
    collection do
      get 'search'
    end
  end

  resources :orders do
    collection do
      get 'search'
    end
  end

  resources :items
  resources :categories
  resources :orders



  resources :users
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'


  get 'carts/:id', to: "carts#show", as: "cart"
  delete 'carts/:id', to: "carts#destroy"
  post 'order_items/add_to_cart/:id', to: 'order_items#add_to_cart', as: 'add_to_cart'

  get 'order_items', to: 'order_items#index'
  post 'order_items/:id/add', to: "order_items#add_quantity", as: "order_items_add"
  post 'order_items/:id/reduce', to: "order_items#reduce_quantity", as: "order_items_reduce"
  post 'order_items', to: "order_items#create"
  get 'order_items/:id', to: "order_items#show", as: "order_item"
  delete 'order_items/:id', to: "order_items#destroy"

  root 'items#index'

end
