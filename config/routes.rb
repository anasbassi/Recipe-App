Rails.application.routes.draw do
  resources :recipelists
  root 'foods#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, except: [:edit, :update]
  # Defines the root path route ("/")
  # root "articles#index"
end
