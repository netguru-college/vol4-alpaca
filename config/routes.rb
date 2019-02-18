# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  get '/auth/failure' => 'omniauth_callbacks#failure'
  root 'home#welcome'
  get 'dashboard', to: "home#dashboard", as: :dashboard
  get 'market_place', to: "alpacas#market_place", as: :market_place


  resources :alpacas
  resources :users

  resources :alpacas do
    put :sell, on: :member
  end
end
