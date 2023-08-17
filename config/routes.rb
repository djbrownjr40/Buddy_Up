Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :activities, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: [:update, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
