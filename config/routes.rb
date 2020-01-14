Rails.application.routes.draw do
  root "cards#index"
  resources :cards, only: [:index, :new]
  resources :items, only: [:index, :new]
  resources :categories, only:[:index]
end
