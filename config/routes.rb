Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries do
    resources :diary_comments, only: :create
  end
  resources :topics
  resources :users, only: [:show, :edit, :update]
  
end
