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
    resources :kakomons, only:[:index,:new,:show,:create,:destroy,:about] do
      resources :comments,only: [:create,:destroy]
      resource :favorites, only: [:create, :destroy]
      resources :reports,only:[:create]
      get :search, on: :collection
    end
    resources :end_users, only:[:index,:show,:edit,:update] do 
      resource :relationships,only: [:create,:destroy]
      get :followings,on: :member
      get :followers,on: :member
      get :search, on: :collection
    end
    get 'end_users/:id/boards'=>'end_users#board'
    resources :messages, only: [:create,:destroy]
    resources :rooms, only: [:create,:show,:index]
    resources :notifications,only:[:index]
    resources :boards,only:[:index,:show,:new,:create,:destroy] do 
      resources :board_comments,only: [:create,:destroy]
      resources :reports,only:[:create]
      get :searchSub, on: :collection
      get :searchProf, on: :collection
    end
  end
  
end
