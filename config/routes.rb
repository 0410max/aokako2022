Rails.application.routes.draw do
  devise_for :users
  root'homes#top'
  resources :users, only:[:index,:show,:edit,:update] do 
    resource :relationships,only: [:create,:destroy]
    get :followings,on: :member
    get :followers,on: :member
  end
  resources :kakomons, only:[:index,:new,:edit,:show,:create,:udpate,:destroy] do
    resources :comments,only: [:create,:destroy]
    resource :favorites, only: [:create, :destroy]
    get :search, on: :collection
  end

  resources :messages, only: [:create,:destroy]
  resources :rooms, only: [:create,:show,:index]
end
