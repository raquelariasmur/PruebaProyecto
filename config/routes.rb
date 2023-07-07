Rails.application.routes.draw do

  get "sign_in", to: "user_sessions#new"
  post "sign_in", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  resources :orders
  resources :order_states
  resources :dishes
  resources :users
  resources :clients
  root "dashboards#index"

  scope module: :api, path: "api" do
    resources :dishes
    resources :orders
    # put "orders", to: "orders#update"
    resources :clients
    resources :order_states
    
    post "client/sign_up", to: "client_registrations#create"
    post "client/sign_in", to: "client_sessions#create"
    delete "client/logout", to: "client_sessions#destroy"
    put "client/:id", to: "clients#update"
    put "client/password/:id", to: "clients#update_password"

    post "user/sign_in", to: "user_sessions#create"
    delete "user/logout", to: "user_sessions#destroy"
  end
  mount ActionCable.server => '/cable'
end
