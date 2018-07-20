Rails.application.routes.draw do
  get 'filters/create'
  devise_for :users
  get 'articles/index'
  get 'articles/new'
  root 'welcome#index'
  resources :users
  resources :articles
  resources :articles do
  resources :comments
  end
end
