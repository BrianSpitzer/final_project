class FavoriteRecipesController < ApplicationController
  def index
    @favorite_recipes = FavoriteRecipe.all

    render("favorite_recipes/index.html.erb")
  end

  def show
    @favorite_recipe = FavoriteRecipe.find(params[:id])

    render("favorite_recipes/show.html.erb")
  end

  def new
    @favorite_recipe = FavoriteRecipe.new

    render("favorite_recipes/new.html.erb")
  end

  def create
    @favorite_recipe = FavoriteRecipe.new

    @favorite_recipe.user_id = params[:user_id]
    @favorite_recipe.recipe_id = params[:recipe_id]
    @favorite_recipe.rating = params[:rating]

    save_status = @favorite_recipe.save

    if save_status == true
      redirect_to("/favorite_recipes/#{@favorite_recipe.id}", :notice => "Favorite recipe created successfully.")
    else
      render("favorite_recipes/new.html.erb")
    end
  end

  def edit
    @favorite_recipe = FavoriteRecipe.find(params[:id])

    render("favorite_recipes/edit.html.erb")
  end

  def update
    @favorite_recipe = FavoriteRecipe.find(params[:id])

    @favorite_recipe.user_id = params[:user_id]
    @favorite_recipe.recipe_id = params[:recipe_id]
    @favorite_recipe.rating = params[:rating]

    save_status = @favorite_recipe.save

    if save_status == true
      redirect_to("/favorite_recipes/#{@favorite_recipe.id}", :notice => "Favorite recipe updated successfully.")
    else
      render("favorite_recipes/edit.html.erb")
    end
  end

  def destroy
    @favorite_recipe = FavoriteRecipe.find(params[:id])

    @favorite_recipe.destroy

    if URI(request.referer).path == "/favorite_recipes/#{@favorite_recipe.id}"
      redirect_to("/", :notice => "Favorite recipe deleted.")
    else
      redirect_to(:back, :notice => "Favorite recipe deleted.")
    end
  end
end
