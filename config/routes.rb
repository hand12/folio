Rails.application.routes.draw do
  root 'products#index'
  resources :products
  get 'products/show' => 'introductions#show'
end
