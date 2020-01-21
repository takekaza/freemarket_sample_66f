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
  resources :cards, only: [:index, :new, :create]
  resources :items, only: [:index, :new, :show] do
  end
  resources :brands, only: [:index, :new, :show]
  resources :categories, only:[:index]
end
