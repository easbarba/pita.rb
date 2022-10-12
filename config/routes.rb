Rails.application.routes.draw do
  get 'home', to: 'pages#home'
  get 'stories', to: 'pages#stories'
  get 'about', to: 'pages#about'

  root to: 'pages#home'
end
