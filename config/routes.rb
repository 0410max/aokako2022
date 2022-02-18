Rails.application.routes.draw do
  devise_for :users
  root'homes#top'
  resources :users, only:[:index,:show,:update]
  resources :kakomons,only:[:index,:update,:create,:destroy]
end
