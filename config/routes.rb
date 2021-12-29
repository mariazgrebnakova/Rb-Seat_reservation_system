Rails.application.routes.draw do
    # Use a custom invitations controller.
    devise_for :users, controllers: { invitations: 'users/invitations' }

    resources :users
    resources :departments
    resources :seats
    resources :reservations

    root to: 'users#index'
end
