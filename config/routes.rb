Rails.application.routes.draw do
  
  root to: "users#index"
  resources :users
  post "/auth/login", to: "authentication#login"

end
