Rails.application.routes.draw do
  get "events/index"
  get "events/show"
  get "events/new"
  get "events/edit"
  get "sessions/new"
  get "users/new"
  # Sets the home page to list all events
  root "events#index"

  # Core Resources
  resources :events do
    resources :registrations, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  # Authentication Paths
  get  'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end