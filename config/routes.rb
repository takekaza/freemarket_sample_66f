Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "items#index"
  get 'items/confirm'
  get 'cards/card'
  get 'cards/card2'
  get 'items/siharai'

  resources :cards, only: [:index, :new, :create]
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  resources :items, only: [:index, :new, :show]
  resources :brands, only: [:index, :new]
  resources :categories, only:[:index]

end
