Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root "pages#index"

  resources :hotels, only: [:index, :show] do
    resources :rooms, only: [:index, :show]
  end

  resource :reservations, only: [:index, :show]

end
