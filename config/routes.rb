Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :users, only: [:show]
  resources :articles
  resources :categories, only: [:index, :show, :destroy]
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
end
