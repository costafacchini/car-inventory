Rails.application.routes.draw do
  root "cars#index"

  resources :cars
  resources :dealerships
end
