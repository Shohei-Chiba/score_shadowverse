Rails.application.routes.draw do
  resources :articles do
  resources :comments
  end
  resources :decks
  get 'users/show'
  get 'users/moreinfo'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'test#index'
  delete :decks, to: 'decks#destroy_all_deck'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

