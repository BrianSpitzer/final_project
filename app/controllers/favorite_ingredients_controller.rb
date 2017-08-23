class FavoriteIngredientsController < ApplicationController
  def index
    @favorite_ingredients = current_user.favorite_ingredients.all

    render("favorite_ingredients/index.html.erb")
  end

  def show
    @favorite_ingredient = FavoriteIngredient.find(params[:id])

    render("favorite_ingredients/show.html.erb")
  end

  def new
    @favorite_ingredient = FavoriteIngredient.new

    render("favorite_ingredients/new.html.erb")
  end

  def create
    @favorite_ingredient = FavoriteIngredient.new

    @favorite_ingredient.user_id = current_user.id
    @favorite_ingredient.ingredient_id = params[:ingredient_id]
    
    save_status = @favorite_ingredient.save

    if save_status == true
      redirect_to(URI(request.referer).path, :notice => "Favorite ingredient created successfully.")
    else
      render("favorite_ingredients/new.html.erb")
    end
  end

  def edit
    @favorite_ingredient = FavoriteIngredient.find(params[:id])

    render("favorite_ingredients/edit.html.erb")
  end

  def update
    @favorite_ingredient = FavoriteIngredient.find(params[:id])

    @favorite_ingredient.user_id = params[:user_id]
    @favorite_ingredient.ingredient_id = params[:ingredient_id]

    save_status = @favorite_ingredient.save

    if save_status == true
      redirect_to("/favorite_ingredients/#{@favorite_ingredient.id}", :notice => "Favorite ingredient updated successfully.")
    else
      render("favorite_ingredients/edit.html.erb")
    end
  end

  def destroy
    @favorite_ingredient = FavoriteIngredient.find(params[:id])

    @favorite_ingredient.destroy

    redirect_to(URI(request.referer).path, :notice => "Favorite ingredient deleted.")
    
  end
end
