# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/about', to: 'pages#about'
  get 'pages/home', to: 'pages#home'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  resources :articles
end
