Rails.application.routes.draw do
  root 'introductions#index'
  get 'products/show' => 'introductions#show'
end
