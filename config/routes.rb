Statusly::Application.routes.draw do
  root to: "application#index"
  resources :users
  resources :statuses, only: [:create, :show]
  resources :sessions, only: [:create, :destroy]
  resources :feeds, only: [:create]
  resources :feed_items, only: [:index]
end
