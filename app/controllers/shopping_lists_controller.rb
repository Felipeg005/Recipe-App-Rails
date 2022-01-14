class ShoppingListsController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe_foods = RecipeFood.all
    @recipe = Recipe.find(params[:recipe_id])
  end
end
