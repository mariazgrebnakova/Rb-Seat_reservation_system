Rails.application.routes.draw do
    devise_for :users

    resources :users
    resources :departments
    resources :seats

    root to: 'users#index'
end
