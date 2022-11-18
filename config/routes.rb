Rails.application.routes.draw do
  root 'foods#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, except: [:edit, :update]
  resources :recipes, except: [:edit, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"
  get '/general_shopping_list', to: 'foods#general'
  get '/public_recipes', to: 'recipes#public'
end
