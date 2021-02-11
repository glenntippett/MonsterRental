Rails.application.routes.draw do

  root to: 'monsters#index'

  devise_for :users

  resources :monsters do
    resources :bookings, only: [:new, :create, :update, :destroy, :show]
  end

  get '/dashboard', to: 'pages#dashboard', as: :dashboard

end
