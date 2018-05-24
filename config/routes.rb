Rails.application.routes.draw do
  root to: "articles#index"

  get "/auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  delete "/signout", to: "sessions#destroy"
  
  resources :articles
end
