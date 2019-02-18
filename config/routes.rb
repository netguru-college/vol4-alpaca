# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :users

  get '/auth/failure' => 'omniauth_callbacks#failure'
  root 'home#welcome'
  get 'dashboard', to: "home#dashboard", as: :dashboard
  get 'market_place', to: "alpacas#market_place", as: :market_place
  #put 'change_owner', to: "ownerships#change_owner", as: :change_


  resources :alpacas
  resources :users
  #resources :ownerships

  resources :alpacas do
    put :sell, on: :member
  end
  resources :ownerships do
    put :change_owner, on: :member
  end
end
