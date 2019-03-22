Rails.application.routes.draw do
  devise_for :accounts,  :controllers => { :registrations => 'registrations' }
    root 'homepage#index', as: 'homepage_index'
    get 'homepage/index'
    get 'say/request'
    get 'say/history'
    get 'say/info'
    get 'say/post'
    resources :employees, only: [:edit, :update]
    resources :budgetapprovers, only: [:edit, :update]
    resources :paymentmanagers, only: [:edit, :update]
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  