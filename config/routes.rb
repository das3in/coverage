Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :news, only: [:index, :show]
  resources :teams
  resources :standings, only: [:index]
end
