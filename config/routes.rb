# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/about', to: 'pages#about'
  get 'pages/home', to: 'pages#home'
end
