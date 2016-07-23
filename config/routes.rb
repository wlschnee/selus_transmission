Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  root to: "posts#index"
  resources :users, only: [:index, :show, :update]
  resources :posts
  resources :categories
  resources :comments
  resources :registrations, only: [:create, :edit, :update, :destroy]
  get 'dashboard', to: 'dashboard#show', as: 'dashboard'
  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
end
