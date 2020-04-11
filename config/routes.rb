Rails.application.routes.draw do
  resources :users
  resources :properties
  resources :leases
  resources :applications

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  get '/landlord_properties/:id', to: 'users#landlord_properties'
  post '/rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  patch '/update_availability/:id', to: 'properties#update_availability'

end
