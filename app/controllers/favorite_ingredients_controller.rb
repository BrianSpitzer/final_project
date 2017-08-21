class FavoriteIngredientsController < ApplicationController
  def index
    @favorite_ingredients = FavoriteIngredient.all

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
    
    back_to = params[:back_to]

    save_status = @favorite_ingredient.save

    if save_status == true
      if back_to == "ingredients_index"
        redirect_to("/ingredients", :notice => "Favorite ingredient created successfully.")
      elsif back_to == "ingredient"
        key = params[:key]
        redirect_to("/ingredients"+key.to_s, :notice => "Favorite ingredient created successfully.")
      else
        redirect_to("/ingredients", :notice => "Favorite ingredient created successfully.")
      end
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
    back_to = params[:back_to]
    key = params[:key]

    @favorite_ingredient.destroy

    if URI(request.referer).path == "/favorite_ingredients/#{@favorite_ingredient.id}"
      redirect_to("/", :notice => "Favorite ingredient deleted.")
    else
      if back_to == "ingredients_index"
        redirect_to("/ingredients", :notice => "Favorite ingredient deleted.")
      elsif back_to == "ingredient"
        key = params(:key)
        redirect_to("/ingredient"+key.to_s, :notice => "Favorite ingredient deleted.")
      end
    end
  end
end
