Rails.application.routes.draw do

  root to: 'monsters#index'

  devise_for :users


  resources :monsters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
