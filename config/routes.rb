Rails.application.routes.draw do

  root 'sessions#home'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :tenants do
    resources :reservations
  end

  resources :users
  resources :hotels do
    resources :rooms
  end

end
