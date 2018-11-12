Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :patients, :default => 'json'
  resources :doctors, :default => 'json'
  resources :appointments, :default => 'json'
end
