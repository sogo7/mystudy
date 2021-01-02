Rails.application.routes.draw do
  root "posts#index"

  get "top/index"

  get 'users/new'
  post "users/create"

  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :posts 
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
