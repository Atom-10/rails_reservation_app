Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :rooms
  get "/account" => "users#account"
  get "user/account" => "devise/passwords#edit"
  get "/user_room" => "rooms#user_room"
end
