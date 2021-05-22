Rails.application.routes.draw do
  resources :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "restaurants#index"
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

  controller :courses do
    get 'courses/index/:id' => :index
    get 'courses/search/:id' => :search
  end

  get 'categories', to: "categories#index"
end
