Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products do
    resources :likes, only: [:create, :destroy]
  end
  resources :lectures, only: [:index, :create, :destroy, :edit, :show]
  resources :lecture_comments, only: [:create, :destroy, :new]
  resources :product_comments, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :update]
  get 'products/show' => 'introductions#show'
end
