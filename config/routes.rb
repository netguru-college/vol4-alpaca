# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'
  }

  get '/auth/failure' => 'omniauth_callbacks#failure'
  root 'home#welcome'


end
