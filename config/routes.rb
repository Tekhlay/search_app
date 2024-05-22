Rails.application.routes.draw do
  get 'analytics/index'
  get 'search/index'
  resources :search, only: [:index, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "search#index"
end
