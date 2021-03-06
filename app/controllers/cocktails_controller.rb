class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    # @ingredient = Ingredient.new(cocktail: @cocktail)
    @dose = Dose.new(cocktail: @cocktail)
  end

  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient.all
    # @doses = Dose.new(cocktail: @cocktail)
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end
end
