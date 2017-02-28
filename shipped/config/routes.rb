Rails.application.routes.draw do
  get 'registrations/update'

  devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'home/index'

  resources :users, :only => [:show]
  resources :jobs
  resources :boats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
