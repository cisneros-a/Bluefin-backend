Rails.application.routes.draw do
  resources :users
  resources :properties
  resources :leases
  resources :applications

  post '/login', to: 'auth#create'


end
