Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :users, :only => [:show]

  resources :jobs

  resources :boats
end
