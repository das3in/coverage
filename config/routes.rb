Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  namespace "api" do
    namespace "v1" do
      resources :posts
      resources :news, only: [:show]
      resources :tournaments
      post "/tournaments/:id/create_field" => "tournaments#create_field"
      post "/tournaments/:tournamentId/matches/:id/create_point" => "matches#create_point"
      post "/users/sign_in" => "sessions#create"
    end
  end

  resources :news, only: [:index, :show]
  resources :teams
  resources :standings, only: [:index]
  resources :tournaments do
    resources :matches
    resources :microposts, only: [:create]
    resources :registered_teams
  end
  resources :posts

  get "/tournaments/:id/live_updates" => "tournaments#live_notifications"
  get "/tournaments/:id/teams_for_division" => "tournaments#teams_for_division"
  post "/matches/:id/generate_prediction" => "matches#generate_prediction"

  mount ActionCable.server, at: "/cable"
end
