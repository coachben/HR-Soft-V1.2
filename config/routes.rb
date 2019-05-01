Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :roles
  devise_for :users

  resources :employees
  resources :workers
  
  resources :companies do
  resources :employees
  end
  
  resources :companies do
  resources :workers
  end
  
  get 'home/index'
  
  root to: 'home#index'
  
  resources :salaries

  resources :workers do
    resources :payslips

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
