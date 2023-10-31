Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  resources :projects
  resources :users, only: [:show, :index, :update]
end
