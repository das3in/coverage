Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  namespace "api" do
    namespace "v1" do
      resources :posts
      resources :fantasy
      resources :news, only: [:show]
      post "/users/sign_in" => "sessions#create"
    end
  end

  resources :news, only: [:index, :show]
  resources :teams
  resources :standings, only: [:index]
  resources :tournaments do
    resources :matches
    resources :microposts, only: [:create]
  end
  resources :pickems
  resources :posts

  get "/tournaments/:id/live_updates" => "tournaments#live_notifications"
  post "/matches/:id/generate_prediction" => "matches#generate_prediction"

  mount ActionCable.server, at: "/cable"
end
