Rails.application.routes.draw do
  resources :employees, only: [:show, :index, :update]
  devise_for :users

  # Defines the root path route ("/")
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  resources :projects
end
