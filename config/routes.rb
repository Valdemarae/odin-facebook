Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/create'
  get 'posts/update'
  get 'posts/edit'
  get 'posts/destroy'
  devise_for :users
  resources :users, only: [:show, :index]
  resources :posts, except: [:show]
  resources :friendships, only: [:index, :show]
  root 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
