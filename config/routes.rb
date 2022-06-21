Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    resources :kakomonreports ,only: [:index,:update]
    resources :boardreports ,only: [:index,:update]
    resources :userreports,only: [:index,:update]
    resources :end_users, only: [:index,:show] do 
      resources :rooms ,only: [:show,:index]
    end
    get 'search' => 'end_users#search'
    get 'clear' => 'end_users#clear'
    patch 'unsubscribe/:id' => 'end_users#unsubscribe'
    resources :boards, only: [:destroy,:index,:update] do 
      resources :boardfavorites,only: [:create]
    end
    resources :kakomons, only: [:destroy,:index,:update] do 
      resources :kakomonfavorites,only: [:create]
    end
  end

  scope module: :public do
    root'homes#top'
    resources :kakomons, only:[:index,:new,:show,:create,:destroy,:about] do
      resources :kakomon_comments,only: [:create,:destroy]
      resource :kakomonfavorites, only: [:create, :destroy]
      resources :kakomonreports,only:[:create]
      get :searchSub, on: :collection
      get :searchProf, on: :collection
      get :searchClear,on: :collection
    end
    resources :end_users, only:[:index,:show,:edit,:update] do 
      resource :relationships,only: [:create,:destroy]
      resources :userreports,only:[:create]
    end
    resources :messages, only: [:create,:destroy]
    resources :rooms, only: [:create,:show,:index]
    resources :notifications,only: [:index] do
      patch :read, on: :member
    end
    resources :boards,only:[:index,:show,:new,:create,:destroy] do 
      resource :boardfavorites, only: [:create, :destroy]
      resources :board_comments,only: [:create,:destroy]
      resources :boardreports,only:[:create]
      get 'report' => 'boardreports#report'
      get :searchSub, on: :collection
      get :searchProf, on: :collection
      get :searchClear,on: :collection
    end
    resources :nokakomons,only:[:index]
    resources :noboards,only:[:index]
    patch 'end_users/unsubscribe' => 'end_users#unsubscribe'
  end
end
