Statusly::Application.routes.draw do
  root to: "application#index"
  resources :users
  resources :statuses, only: [:create]
end
