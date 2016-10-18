Rails.application.routes.draw do
  resources :factors
  resources :responses
  resources :questions
  resources :settings
  resources :profiles
  resources :works
  resources :dealings

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dealings#index"
end
