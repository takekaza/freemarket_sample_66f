Rails.application.routes.draw do
  root "items#index"
  resources :cards, only: [:index, :new]
  resources :items, only: :new
end
