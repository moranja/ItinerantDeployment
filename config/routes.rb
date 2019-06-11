Rails.application.routes.draw do
  resources :attractions
  resources :areas
  resources :cities
  resources :plans
  resources :itineraries
  resources :user_itineraries
  resources :users

  post '/login', to: 'users#authenticate'
  post '/copyItinerary', to: 'itineraries#copy'
  post '/itineraries/:id/nearest', to: 'itineraries#nearest'

  get '*path', to: "application#react_app", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
