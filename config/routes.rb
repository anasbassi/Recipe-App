Rails.application.routes.draw do
  root 'foods#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, except: [:edit, :update]
  resources :recipes
  # Defines the root path route ("/")
  # root "articles#index"
end
