Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  devise_for :users

  get 'foods', to: 'foods#index', as: 'foods'
  get 'foods/new', to: 'foods#new', as: 'foods_new'
  get 'recipes', to: 'recipes#index', as: 'recipes'
  get 'recipes/new', to: 'recipes#new', as: 'recipes_new'
  get 'recipes/:recipe_id', to: 'recipes#show'
  get '/public_recipes', to: 'recipes#public', as: 'public_recipes'
  get 'recipes/:recipe_id/new', to: 'recipe_foods#new', as: 'recipe_foods_new'
  get 'general_shoping_list', to: 'shopping_lists#index', as: 'general_shopping_list'
  get 'general_shoping_list/:recipe_id', to: 'shopping_lists#show'

  post 'foods/new', to: 'foods#create', as: 'create_new_food'
  post 'foods/delete', to: 'foods#delete', as: 'delete_food'
  post 'recipes/new', to: 'recipes#create', as: 'create_new_recipe'
  post 'recipes/delete', to: 'recipes#delete', as: 'delete_recipe'
  post 'recipes/:recipe_id/new', to: 'recipe_foods#create', as: 'create_new_recipe_food'
  post 'recipes/:recipe_id/delete', to: 'recipe_foods#delete', as: 'delete_recipe_food'
end
