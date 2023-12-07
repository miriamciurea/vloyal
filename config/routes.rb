Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: "cards#index"
  get 'basic-qr-code-reader', to: 'basic_qr_codes#index'
  get 'diagnostics', to: 'pages#diagnostics'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: [:show] do
    resources :brands, only: [:new]
  end
  resources :brands, only: [:index, :show, :create, :update, :edit] do
    patch :increment, on: :member
    resources :locations, only: [:create]
    collection do
      get "map"
    end
    resources :cards, only: [:create]
  end

  post "set_user_location", to: "brands#set_user_location"
  get "get_user_location", to: "brands#get_user_location"
  resources :cards, only: [:index, :destroy]
  resources :rewards, only: [:index] do
    patch :claim, on: :member
  end
  # patch "rewards/:id", to: "rewards#claim", as: :claim_reward

  # Defines the root path route ("/")
  # root "posts#index"
end
