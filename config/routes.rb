Rails.application.routes.draw do
    # Use a custom invitations controller.
    devise_for :users, controllers: { invitations: 'users/invitations' }

    resources :users
    resources :departments
    resources :seats
    resources :home , only: [:index]

    resources :reservations do
      get :map, on: :collection # https://guides.rubyonrails.org/routing.html#nested-resources
      post :submit_from_map, on: :collection
    end

    root to: 'home#index'
end
