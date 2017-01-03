Rails.application.routes.draw do
  resources :boards do
    resources :cards
  end
  root 'boards#index'
end
