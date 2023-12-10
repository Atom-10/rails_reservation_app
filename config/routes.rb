Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :rooms do
    resources :reservations, only: [:create]
  end
  resources :rooms do
    post 'confirm_reservation', on: :member
  end
  resources :reservations do
    member do
      get "confirmation"
    end
  end
  get "/account" => "users#account"
  get "/user_room" => "rooms#user_room"
end
