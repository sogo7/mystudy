Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'

  root "posts#index"

  get "top/index"

  get 'users/new'
  post "users/create"

  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :posts do
    post "add", to: "likes#create"
    delete "/add", to: "likes#destroy"
  end
  resources :users

  resources :posts, except: [:index] do
    resources :comments, only: [:create, :destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
