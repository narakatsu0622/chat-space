Rails.application.routes.draw do

  devise_for :users
  root to: "top#index"
  resources :groups, except: [:show,:destroy,:index] do
    collection do
      get :ajax_user_list
    end
    resources :messages, only: [:index, :create]
  end
end
