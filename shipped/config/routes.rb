Rails.application.routes.draw do
  #make routing for form

  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: 'home#index'

  resources :users, :only => [:show]

  resources :jobs

  resources :boats

  resources :routes, :only => [:create]
  delete '/routes' => 'routes#destroy'

end
