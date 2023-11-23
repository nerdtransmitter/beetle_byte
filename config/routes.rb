Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  resources :employees, only: [:show, :index, :update_role] do
    patch :update_role, on: :member # PATCH request /employees/:id/update_role
  end

  resources :projects do
    resources :tickets do
      patch :close_ticket, on: :member # PATCH request /projects/:project_id/tickets/:id/close_ticket
    end
  end

  # Additional non-nested route for all tickets
  resources :tickets, only: [:index] do
    collection do
      get :all_tickets
    end
  end
end
