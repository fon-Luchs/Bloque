Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :users
  resources :articles
  resources :categories, only: [:index, :show]
  resources :articles do
    resources :comments
  end
end
