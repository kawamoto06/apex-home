Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries do
    resources :diary_comments, only: [:create, :edit, :update, :destroy] 
  end
  resources :topics do
    resources :topic_comments, only: [:create, :edit, :update, :destroy] 
  end
  resources :users, only: [:show, :edit, :update]
  
end
