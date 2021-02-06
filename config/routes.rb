Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  resources :monsters do
    resources :bookings, only: [:new, :create, :update, :destroy, :show]
  end

end
