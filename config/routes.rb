Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # get '/restaurants', to: 'restaurants#index', as: :restaurants
  resources :restaurants do
    # routes that doesn't need the :id
    collection do
      # will start with "/restaurants/" followed by what we add below "/whatever"
      get :top
    end
    # routes that needs the :id
    member do
      # will start with "/restaurants/:id/" followed by what we add below "/whatever"
      get :chef
    end

    # WE need to nest in case we need to know the ID of the parent
    resources :reviews, only: [ :new, :create]
  end

  resources :reviews, only: [:destroy]


  # get '/restaurants/top', to: 'restaurants#top'
end
