Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "main#index"
  get "/signup", to: "signup#new"
  post "/signup", to: "signup#create"

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  resources :toys
  get "/dashboard", to: "toys#dashboard"

  get "/about", to: "about#index"
  
end
