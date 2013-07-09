Statusly::Application.routes.draw do
  root to: "application#index"
  resources :users
  resources :statuses, only: [:create, :show]
  resources :feed_items, only: [:index]
  resources :pending_requests, only: [:create]

  post "login" => "sessions#create", as: "login"
  get "logout" => "sessions#destroy", as: "logout"
  post "accept_request" => "feed_sources#create", as: "accept_request"
end
