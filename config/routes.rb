Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "restaurants#index"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
  
  #     Model                       HTTP
  # C  .create  .new/.save          POST
  # R  .find_by  .where .count      GET
  # U  .update  .find_by/.save      PATCH
  # D  .delete                      DELETE

  resources :restaurants
  resources :reservations
  resources :users
  resources :reviews
  resources :statistics
end
