# frozen_string_literal: true

Rails.application.routes.draw do

  # Home page
  root to: 'static_pages#home'

  # Devise routes
  devise_for :users

  # ----------- Route declarations -----------
  resources :users, only: [:show, :destroy]
  resources :dreams
end
