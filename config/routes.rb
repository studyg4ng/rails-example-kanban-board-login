Rails.application.routes.draw do
  resources :boards do
    resources :cards
  end
  root 'boards#index'

  match 'auth/:facebook/callback', to: 'sessions#create',  via: [:get, :post]
end
