Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # basic routing for now
  resources :users do 
    resources :decks, only: [:index, :create]
  end
  resources :decks, only: [:update, :destroy] do
    resources :flash_cards, only: [:index, :create]
  end
  resources :flash_cards, only: [:update, :destroy]
  
end
