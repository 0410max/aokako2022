Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    resources :kakomons ,only: [:index,:show]
    resources :boards ,only: [:index,:show]
    resources :end_users, only: [:index,:show]
  end

  scope module: :public do
    root'homes#top'
    resources :kakomons, only:[:index,:new,:show,:create,:destroy,:about] do
      resources :comments,only: [:create,:destroy]
      resource :favorites, only: [:create, :destroy]
      resources :kakomonreports,only:[:create]
      get :searchSub, on: :collection
      get :searchProf, on: :collection
      get :searchClear,on: :collection
    end
    resources :end_users, only:[:index,:show,:edit,:update] do 
      resource :relationships,only: [:create,:destroy]
    end
    resources :messages, only: [:create,:destroy]
    resources :rooms, only: [:create,:show,:index]
    resources :notifications,only:[:index]
    resources :boards,only:[:index,:show,:new,:create,:destroy] do 
      resource :boardfavorites, only: [:create, :destroy]
      resources :board_comments,only: [:create,:destroy]
      resources :boardreports,only:[:create]
      get :searchSub, on: :collection
      get :searchProf, on: :collection
      get :searchClear,on: :collection
    end
    resources :nokakomons,only:[:index]
    resources :noboards,only:[:index]
    patch 'end_users/unsubscribe' => 'end_users#unsubscribe'
  end
  
end
