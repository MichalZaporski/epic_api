Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants
  root to: "restaurants#index"
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

  namespace :api do
    namespace :v1 do
      controller :courses do
        get 'restaurants/:restaurant_id/courses/index' => :index
        get 'restaurants/:restaurant_id/courses/search' => :search
        get 'restaurants/:restaurant_id/courses/:course_id' => :show
      end

      controller :restaurants do
        get 'restaurants' => :index
        get 'restaurants/search' => :search
      end

      post 'authentication', to: "authentication#create"
      get 'categories', to: "categories#index"
    end
  end
end
