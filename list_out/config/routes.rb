Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'dashbords/doctor_create'
  post 'dashboards/patient_create'
  resources :dashboards
  root to: 'dashboards#index'
end
