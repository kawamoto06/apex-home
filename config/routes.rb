Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  root to: 'diaries#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :diaries do
    resources :diary_comments, only: [:create, :edit, :update, :destroy] 
  end
  resources :topics do
    resources :topic_comments, only: [:create, :edit, :update, :destroy] 
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :galleries
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :index, :show, :destroy]
end
