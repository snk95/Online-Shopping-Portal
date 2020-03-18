Rails.application.routes.draw do
  # get 'access/new'

  # get 'admin/index'

  resources :users
  resources :orders
  resources :lineitems
  resources :carts
  resources :products

  root "shopper#index", as: "root"
  get "shopper", to: "shopper#index"
  get "shopper/index", as: "shopper_url"
  get "admin", to: "admin#index"
  get "login", to: "access#new"
  post 'login', to: "access#create"
  delete 'logout', to: "access#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

