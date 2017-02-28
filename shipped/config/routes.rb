Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  resources :users, :only => [:show]
  resources :jobs
  resources :boats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
