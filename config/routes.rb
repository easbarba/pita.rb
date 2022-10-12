Rails.application.routes.draw do
  devise_for :users
  get 'home', to: 'pages#home'
  get 'stories', to: 'pages#stories'
  get 'about', to: 'pages#about'

  root to: 'pages#home'
end
