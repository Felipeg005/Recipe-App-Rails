class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end
  
  def create
    if RecipeFood.new(recipe_foods_params).invalid?
      flash[:notice] = 'The Recipe was not saved for incorrect data'
      redirect_to "/recipes/#{params[:recipe_id]}/new"
    else
      @recipe_food = RecipeFood.create!(recipe_foods_params)
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
  
  private

  def recipes_params
    params.require(:recipe_foods).permit(:food_id, :recipe_id, :quantity)
  end
end
