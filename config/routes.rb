Rails.application.routes.draw do
  root to: "posts#index"
  resources :users, only: [:index, :show]
  resources :posts
  resources :comments
  resources :registrations, only: [:create, :edit, :update, :destroy]
  resources :categories
  get 'dashboard', to: 'dashboard#show', as: 'dashboard'
  get 'sign-up', to: 'registrations#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
end
