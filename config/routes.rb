Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    
  end

  scope module: :public do
    root'homes#top'
    get 'end_users/:id/boards'=>'end_users#board'
    resources :kakomons, only:[:index,:new,:show,:create,:destroy,:about] do
      resources :comments,only: [:create,:destroy]
      resource :favorites, only: [:create, :destroy]
      resources :reports,only:[:create,:index]
      get :search, on: :collection
    end
    resources :end_users, only:[:index,:show,:edit,:update] do 
      resource :relationships,only: [:create,:destroy]
      get :followings,on: :member
      get :followers,on: :member
      get :search, on: :collection
    end
    resources :messages, only: [:create,:destroy]
    resources :rooms, only: [:create,:show]
    resources :notifications,only:[:index]
    resources :boards,only:[:index,:show,:new,:create,:destroy] do 
      resources :board_comments,only: [:create,:destroy]
      get :search, on: :collection
    end
  end
  
end
