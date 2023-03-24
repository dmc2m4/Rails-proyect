Rails.application.routes.draw do
  
  root to: "users#index"
  
  resources :users do
    resources :posts
  end

  post "/auth/login", to: "authentication#login"

end
