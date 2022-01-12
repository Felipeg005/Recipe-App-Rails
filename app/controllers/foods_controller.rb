class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @user = current_user
    if Food.new(foods_params).invalid?
      flash[:notice] = 'The Food was not saved for incorrect data'
      redirect_to "/foods/new/"
    else
      @food = Food.create!(foods_params)
      respond_to do |format|
        format.html do
          if @food.save
            # success message
            flash[:success] = 'Food saved successfully'
            # redirect to index
            redirect_to "/foods/"
          else
            # error message
            flash.now[:error] = 'Error:  Food could not be saved'
            # render new
            render :new, locals: { food: @food }
          end
        end
      end
    end
  end

  private

  def foods_params
    params.require(:food).permit(:user_id, :name, :measurement_unit, :price)
  end
end
