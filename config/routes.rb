# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/about', to: 'pages#about'
  get 'pages/home', to: 'pages#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: [:new]
  resources :articles
  resources :categories, except: [:destroy]

end
