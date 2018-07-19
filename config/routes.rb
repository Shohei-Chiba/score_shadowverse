Rails.application.routes.draw do
  resources :articles do
  resources :comments
end
  get 'users/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'test#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

