Rails.application.routes.draw do
  devise_for :users
  root'homes#top'
  resources :kakomons, only:[:index,:new,:show,:create,:destroy,:about] do
    resources :comments,only: [:create,:destroy]
    resource :favorites, only: [:create, :destroy]
    resources :reports,only:[:create,:index]
    get :search, on: :collection
  end
  resources :users, only:[:index,:show,:edit,:update] do 
    resource :relationships,only: [:create,:destroy]
    get :followings,on: :member
    get :followers,on: :member
    get :search, on: :collection
  end
  resources :messages, only: [:create,:destroy]
  resources :rooms, only: [:create,:show,:index]
  resources :notifications,only:[:index]
end
