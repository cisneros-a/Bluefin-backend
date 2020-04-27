Rails.application.routes.draw do
  resources :users
  resources :properties
  resources :leases
  resources :applications
  resources :fixes

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  get '/landlord_properties/:id', to: 'properties#landlord_properties'
  get '/landlord_lease/:id', to: 'leases#landlord_lease'
  get '/tenant_lease/:id', to: 'leases#tenant_lease'
  get '/landlord_applications/:id', to: 'applications#landlord_applications'
  get '/tenant_applications/:id', to: 'applications#tenant_applications'
  post '/rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  patch '/update_availability/:id', to: 'properties#update_availability'
  patch '/update_resolved/:id', to: 'fixes#update_resolved'


end
