# frozen_string_literal: true

Rails.application.routes.draw do
  # Home page
  root to: 'static_pages#home'

  # Devise routes
  devise_for :users
end
