


Rails.application.routes.draw do



  resources :departments



namespace :admin do
      resources :super_accounts
      resources :accounts
      resources :budgets
      resources :employees
      resources :payments
      resources :requests
      


      
      root to: "accounts#index"
    end

  devise_for :accounts,  :controllers => { :registrations => 'registrations' }
    root 'homepage#index', as: 'homepage_index'
    get 'homepage/index'
    get 'say/request'
    get 'say/history'
    get 'say/info'
    get 'say/post'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :employees, only: [:edit, :update]
    resources :budgets, only: [:edit, :update]
    resources :payments, only: [:edit, :update]

    resources :requests do
      resources :expects, except: [:index], controller: 'requests/expects'
    end

    resources :post_travels do
      resources :actuals, except: [:index], controller: 'post_travels/actuals'
    end

  
  end




  