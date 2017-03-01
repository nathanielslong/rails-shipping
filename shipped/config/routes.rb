Rails.application.routes.draw do

  get 'registrations/update'

  
  devise_for :users, :controllers => {:registrations => "registrations"}


  root to: 'home#index'

  # get '/users/sign-up', to: "registrations#new"

  resources :users, :only => [:show]

  resources :jobs

  resources :boats
end
