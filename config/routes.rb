# frozen_string_literal: true

Rails.application.routes.draw do

  # Home page
  root to: 'static_pages#home'

  # Charts route
  get '/statistics', to: 'static_pages#statistics'

  # Devise routes
  devise_for :users

  # ----------- Route declarations -----------
  resources :users, only: [:show, :destroy]
  resources :dreams
  resources :nightmares
  resources :lucids

  resources :posts do
    resources :comments
    resources :likes
  end

end
