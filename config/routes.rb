Rails.application.routes.draw do
  resources :settings
  resources :profiles
  resources :works
  devise_for :users
  resources :dealings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dealings#index"
end
