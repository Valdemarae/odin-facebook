Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}
    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
    end
    devise_scope :user do
      get 'signup', to: 'devise/registrations#new'
    end
  resources :users, only: [:show, :index]
  resources :posts, except: [:show]
  resources :friendships, only: [:index, :show]
  resources :likes, :comments, only: [:create, :destroy]
  resources :friendships, only: [:create, :update, :destroy]
  resources :informations, only: [:update, :edit]
  root 'posts#index'
  get 'users/:id/notifications', to: 'users#notification', as: 'notification'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
