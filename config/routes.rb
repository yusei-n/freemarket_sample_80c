Rails.application.routes.draw do

  devise_for :users
  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :create, :new, :update] do
    resources :cards, only: [:new, :create, :delete, :show]
    resources :addresses, only: [:create, :edit, :update, :new]
    member do
      get :logout
    end
  end

  resources :products do
    collection do
      get :search
    end
    resources :orders, only: [:show, :delete, :new, :create]
  end
end

