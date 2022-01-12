class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    if Recipe.new(recipes_params).invalid?
      flash[:notice] = 'The Recipe was not saved for incorrect data'
      redirect_to '/recipes/new/'
    else
      @recipe = Recipe.create!(recipes_params)
      respond_to do |format|
        format.html do
          if @recipe.save
            # success message
            flash[:success] = 'Recipe saved successfully'
            # redirect to index
            redirect_to '/recipes/'
          else
            # error message
            flash.now[:error] = 'Error: Recipe could not be saved'
            # render new
            render :new, locals: { recipe: @recipe }
          end
        end
      end
    end
  end

  private

  def recipes_params
    params.require(:recipe).permit(:id, :user_id, :name, :cooking_time, :preparation_time, :description, :public)
  end
end
