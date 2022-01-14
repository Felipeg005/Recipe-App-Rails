class ShoppingListController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end
