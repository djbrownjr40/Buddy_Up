Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :activities, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
  end

  namespace :owner do
    resources :bookings, only: :index
    # equivalent to => get '/<namespace>/bookings', to: '<namespace>/bookings#index'
  end
  resources :bookings, only: [:update, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
