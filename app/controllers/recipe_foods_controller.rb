class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @food_id = Food.find_by(name: params[:recipe_food]['food_id']).id
    @recipe_id = params[:recipe_food]['recipe_id']
    @quantity = params[:recipe_food]['quantity']
    @added_recipe_food = RecipeFood.find_by(recipe_id: @recipe_id, food_id: @food_id)
    if @added_recipe_food
      flash[:notice] = 'This Food was already added'
      redirect_to "/recipes/#{params[:recipe_id]}/new"
    elsif RecipeFood.new(food_id: @food_id, recipe_id: @recipe_id, quantity: @quantity).invalid?
      flash[:notice] = 'The Recipe was not saved for incorrect data'
      redirect_to "/recipes/#{params[:recipe_id]}/new"
    else
      @recipe_food = RecipeFood.create!(food_id: @food_id, recipe_id: @recipe_id, quantity: @quantity)
      respond_to do |format|
        format.html do
          if @recipe_food.save
            # success message
            flash[:success] = 'Recipe saved successfully'
            # redirect to index
            redirect_to "/recipes/#{params[:recipe_id]}/"
          else
            # error message
            flash.now[:error] = 'Error: Recipe could not be saved'
            # render new
            render :new, locals: { recipe_food: @recipe_food }
          end
        end
      end
    end
  end

  def delete
    @recipe_food = RecipeFood.find_by(recipe_id: params[:recipe_id], food_id: params[:food_id])
    if @recipe_food.destroy
      flash[:success] = 'Recipe destroyed successfully'
    else
      flash[:error] = 'Error: Recipe could not be destroyed'
    end
    redirect_back(fallback_location: root_path)
  end
end
