Rails.application.routes.draw do
    resources :departments
end

Rails.application.routes.draw do
    resources :seats
end

Rails.application.routes.draw do
    resources :users
end
