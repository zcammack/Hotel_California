Rails.application.routes.draw do

  devise_for :users
  root 'hotels#index'

  resources :tenants do
    resources :reservations
  end

  resources :hotels do
    resources :rooms
  end

end
