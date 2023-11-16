Rails.application.routes.draw do
  devise_for :users
  resources :employees, only: [:show, :index, :update]

  # Defines the root path route ("/")
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  resources :projects
end
