Rails.application.routes.draw do
  root to: "home#index"

  resources :news, only: [:index, :show]
end
