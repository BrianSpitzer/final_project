class RecipeIngredientsController < ApplicationController
  def index
    @recipe_ingredients = RecipeIngredient.all

    render("recipe_ingredients/index.html.erb")
  end

  def show
    @recipe_ingredient = RecipeIngredient.find(params[:id])

    render("recipe_ingredients/show.html.erb")
  end

  def new
    @recipe_ingredient = RecipeIngredient.new

    render("recipe_ingredients/new.html.erb")
  end

  def create
    @recipe_ingredient = RecipeIngredient.new

    @recipe_ingredient.recipe_id = params[:recipe_id]
    @recipe_ingredient.ingredient_id = params[:ingredient_id]
    @recipe_ingredient.quantity = params[:quantity]

    save_status = @recipe_ingredient.save

    if save_status == true
      redirect_to("/recipe_ingredients/#{@recipe_ingredient.id}", :notice => "Recipe ingredient created successfully.")
    else
      render("recipe_ingredients/new.html.erb")
    end
  end

  def edit
    @recipe_ingredient = RecipeIngredient.find(params[:id])

    render("recipe_ingredients/edit.html.erb")
  end

  def update
    @recipe_ingredient = RecipeIngredient.find(params[:id])

    @recipe_ingredient.recipe_id = params[:recipe_id]
    @recipe_ingredient.ingredient_id = params[:ingredient_id]
    @recipe_ingredient.quantity = params[:quantity]

    save_status = @recipe_ingredient.save

    if save_status == true
      redirect_to("/recipe_ingredients/#{@recipe_ingredient.id}", :notice => "Recipe ingredient updated successfully.")
    else
      render("recipe_ingredients/edit.html.erb")
    end
  end

  def destroy
    @recipe_ingredient = RecipeIngredient.find(params[:id])

    @recipe_ingredient.destroy

    if URI(request.referer).path == "/recipe_ingredients/#{@recipe_ingredient.id}"
      redirect_to("/", :notice => "Recipe ingredient deleted.")
    else
      redirect_to(:back, :notice => "Recipe ingredient deleted.")
    end
  end
end
