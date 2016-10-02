Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products
  resources :lectures
  resources :lecture_comments
  resources :product_comments
  resources :users
  get 'products/show' => 'introductions#show'
end
