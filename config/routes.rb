Rails.application.routes.draw do
  devise_for :users
  root'homes#top'
  resources :users, only:[:index,:show,:edit,:update]
  resources :kakomons, only:[:index,:new,:edit,:create,:udpate,:destroy] do
    resources :comments,only: [:create,:destroy]
  end

end
