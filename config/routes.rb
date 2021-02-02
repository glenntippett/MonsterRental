Rails.application.routes.draw do

  get 'bookings/create'
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/update'
  get 'bookings/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :monster
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
