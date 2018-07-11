Rails.application.routes.draw do
  devise_for :users
  get 'articles/show'
  get 'articles/new'
  root 'welcome#index'
  resources :users
  resources :articles
  resources :articles do
  resources :comments
  end
end
