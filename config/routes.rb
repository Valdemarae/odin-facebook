Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index]
  resources :posts, except: [:show]
  resources :friendships, only: [:index, :show]
  resources :likes, :comments, only: [:create]
  root 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
