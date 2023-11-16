Rails.application.routes.draw do
  devise_for :users

  resources :employees, only: [:show, :index, :update_role] do
    member do
      patch :update_role
    end
  end

  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  resources :projects
end
