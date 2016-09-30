Rails.application.routes.draw do
  root 'products#index'
  resources :products
  resources :lectures
  resources :lecture_comments
  get 'products/show' => 'introductions#show'
end
