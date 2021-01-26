Rails.application.routes.draw do

  devise_for :users
  root 'sessions#home'

  resources :tenants do
    resources :reservations
  end

  resources :hotels do
    resources :rooms
  end

end
