Rails.application.routes.draw do
  root to: "pages#home"

  # Authentication
  devise_for :users

  # Stories
  resources :stories

  # Pages
  get "home", to: "pages#home"
  get "about", to: "pages#about"
end
