Rails.application.routes.draw do

  root to: 'monsters#index'

  devise_for :users

  resources :monsters do
    resources :bookings, only: [:new, :create]


  get '/dashboard', to: 'pages#dashboard', as: :dashboard


  end
  resources :bookings,only: [:update, :destroy, :show] do
    resources :reviews, only: [ :new, :create ]
  end
end
