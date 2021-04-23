Rails.application.routes.draw do
  
  devise_for :users
  resources :maps, only: [:new, :create]
end
