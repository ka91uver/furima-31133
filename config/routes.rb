Rails.application.routes.draw do
  get 'purchases/index'
  devise_for :users
  root to: 'items#index'
  # resources :items, only: [:new, :create]
  resources :items do
    resources :purchases, only: [:index, :new, :create]
  end
  # resources :items, only: :order do
  #   post 'order', on: :member
  # end
end
