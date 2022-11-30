Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries 
  resources :topics
  resources :users, only: [:show, :edit, :update]
  
end
