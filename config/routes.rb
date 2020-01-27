Rails.application.routes.draw do
  root "items#index"


  get 'purchase/index'
  get 'purchase/done'
  get 'cards/card'
  get 'home/show'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'telephones', to: 'users/registrations#new_telephones'
    post 'telephones', to: 'users/registrations#create_telephone'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'users/signup' => 'users/registrations#new_sns', as:"new0_user_registration"
  end
  
  # omniauthのテスト用
  # get "auth/:provider" => "authentications#new", as: :new_authentication
  # get "auth/:provider/callback" => "authentications#create", as: :create_authentication


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'cards/index'
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :items
  resources :brands, only: [:index, :new, :show]
  resources :categories, only:[:index]
  resources :images 

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

end
