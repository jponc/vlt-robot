Rails.application.routes.draw do
  root 'static_pages#index'
  resources :game
  resources :users

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  get "game", to: "game#index"
end
