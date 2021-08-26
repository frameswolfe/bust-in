Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:index]
  resources :toilets do
    resources :bookings, only: %i[new create]
  end
  resources :users, only: [:show] do
    resources :bookings, only: [:index]
  end
end
