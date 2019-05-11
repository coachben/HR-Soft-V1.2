Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :roles
  devise_for :users

  resources :employees
  
  #gives route for import func
  resources :workers do
    collection { post :import }
  end
  
  resources :companies do
    resources :employees
  end
  
  resources :companies do
    resources :workers, controller: 'companies/workers'
  end
  
  get 'home/index'
  
  root to: 'home#index'
  
  resources :salaries

  resources :workers do
    resources :payslips

  end
  
  get '/payslips', to: 'payslips#index', as: :payslips
  post '/payslips/multiple', to: 'payslips#show_multiple', as: :payslips_multiple
  get '/payslips/multiple', to: 'payslips#show_multiple', as: :payslips_export_csv
   

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
