Rails.application.routes.draw do
  get 'analytics/index'
  post 'search/log', to: 'search#log'
  # post 'search/create', to: 'search#create', as: 'search_create'
  resources :search, only: [:index, :log]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'search#index'
end
