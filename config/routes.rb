Rails.application.routes.draw do
  root 'homepage#index', as: 'homepage_index'
  get 'homepage/index'
  get 'say/request'
  get 'say/history'
  get 'say/info'
  get 'say/post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
