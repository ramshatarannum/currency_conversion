Rails.application.routes.draw do
  # Define routes for currency conversions, allowing only create and index actions
  resources :currency_conversions, only: [:create, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
