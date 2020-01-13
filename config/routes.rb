Rails.application.routes.draw do
  root "items#index"
  resources :cards, only: [:index, :new]
end
