Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  devise_for :users

  get 'foods', to: 'foods#index', as: 'foods'
  get 'recipes', to: 'recipes#index', as: 'recipes'
  get 'public_recipes', to: 'recipes#show', as: 'public_recipes'
  get 'general_shoping_list', to: 'recipes#index', as: 'shopping_list'
  get 'foods/new', to: 'foods#new', as: 'foods_new'

  post 'foods/new', to: 'foods#create', as: 'create_new_food'
  post 'foods/delete', to: 'foods#delete', as: 'delete_food'
end
