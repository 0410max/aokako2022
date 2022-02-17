Rails.application.routes.draw do
  root'homes#top'
  devise_for :users
  resources :users, only:[:index,:show,:update]
  resources :kakomons,only:[:index,:update,:create,:destroy]
end
