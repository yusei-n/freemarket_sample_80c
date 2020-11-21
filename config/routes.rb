Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :create, :new, :update] do
    resources :cards, only: [:index, :new, :create, :destroy] do
    collection do
      delete :delete
      end
    end
    resources :addresses, only: [:create, :edit, :update, :new]
    member do
      get :logout
    end
  end

  resources :products do
    collection do
      get :search
    end
    resources :orders, only: [:new, :create, :destroy, :new, :create] do
      collection do
        get :card_order_add
        post :card_registration
      end
    end
    resources :images, only: [:create, :destroy, :new, :show]
  end
end
