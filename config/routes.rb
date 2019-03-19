Rails.application.routes.draw do
  root 'homepage#index', as: 'homepage_index'
  get 'homepage/index'
  get 'say/goodbye'
  get 'say/hello'
  get 'pages/request'
  get 'say/request'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
