Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # basic routing for now
  resources :users
  resources :decks
  resources :flash_cards
end
