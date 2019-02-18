# frozen_string_literal: true

Rails.application.routes.draw do


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :users

  get '/auth/failure' => 'omniauth_callbacks#failure'
  root 'home#welcome'
  get 'dashboard', to: "home#dashboard", as: :dashboard

  resources :alpacas

end
