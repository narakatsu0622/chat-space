Rails.application.routes.draw do

  devise_for :users
  root to: "top#index"
  resources :groups, except: [:show,:destroy,:index] do
    resources :messages, only: [:index, :create]
  end
end
