Rails.application.routes.draw do
  resources :tenants
  resources :reservations
  resources :rooms
  resources :users
  resources :hotels
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
