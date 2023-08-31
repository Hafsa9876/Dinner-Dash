# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
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

  resources :carts, only: [:show, :destroy]
  resources :order_items, only: [:index, :create, :show, :destroy] do
    post :add, on: :member, action: :add_quantity, as: :order_items_add
    post :reduce, on: :member, action: :reduce_quantity, as: :reduce_quantity
  end

  root 'items#index'
end
