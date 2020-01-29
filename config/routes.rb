# frozen_string_literal: true

Rails.application.routes.draw do

  # Home page
  root to: 'static_pages#home'

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

  # ---------- Errors routes ---------------
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#server_error'

end
