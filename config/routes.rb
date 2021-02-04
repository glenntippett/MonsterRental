Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  resources :monsters do
  resources :booking, only: [:new, :update, :destroy]
  end

end
