Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :news, only: [:index, :show]
  resources :teams
  resources :standings, only: [:index]
  resources :tournaments do
    resources :matches
    resources :microposts, only: [:create]
  end
  resources :posts

  mount ActionCable.server, at: "/cable"
end
