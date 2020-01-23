Rails.application.routes.draw do
  root "items#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'cards/card' #暫定的に_が外れてます
  get 'cards/card2'
  get 'home/show'
  get 'brands/index'
  get 'categories/index'

  resources :cards, only: [:index, :new, :create]
  resources :items
  resources :brands, only: [:index, :new, :show]
  resources :categories, only:[:index]

end
