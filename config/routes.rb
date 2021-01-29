Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'hotels#index'

  resources :tenants do
    resources :reservations
  end

  resources :hotels do
    resources :rooms
  end

end
