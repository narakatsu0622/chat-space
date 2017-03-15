Rails.application.routes.draw do

  devise_for :users
  root to: "groups#index"
  resources :groups, except: [:show,:destroy]
end
