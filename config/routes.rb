Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update]
  patch 'users.:id', to: 'users#update'
end
