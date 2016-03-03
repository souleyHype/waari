Rails.application.routes.draw do
  # API definition
  namespace :api, defaults: { format: :json } do
    resources :products
    resources :orders
    resources :customers
    resources :stores
  end
end
