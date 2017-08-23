class IngredientTastesController < ApplicationController
  def index
    @ingredient_tastes = IngredientTaste.all

    render("ingredient_tastes/index.html.erb")
  end

  def show
    @ingredient_taste = IngredientTaste.find(params[:id])

    render("ingredient_tastes/show.html.erb")
  end

  def new
    @ingredient_taste = IngredientTaste.new

    render("ingredient_tastes/new.html.erb")
  end

  def create
    @ingredient_taste = IngredientTaste.new

    @ingredient_taste.ingredient_id = params[:ingredient_id]
    @ingredient_taste.taste_id = params[:taste_id]

    save_status = @ingredient_taste.save

    if save_status == true
      redirect_to("/ingredients/#{@ingredient_taste.ingredient_id}/edit", :notice => "Ingredient taste created successfully.")
    else
      render("ingredient_tastes/new.html.erb")
    end
  end

  def edit
    @ingredient_taste = IngredientTaste.find(params[:id])

    render("ingredient_tastes/edit.html.erb")
  end

  def update
    @ingredient_taste = IngredientTaste.find(params[:id])

    @ingredient_taste.ingredient_id = params[:ingredient_id]
    @ingredient_taste.taste_id = params[:taste_id]

    save_status = @ingredient_taste.save

    if save_status == true
      redirect_to("/ingredient_tastes/#{@ingredient_taste.id}", :notice => "Ingredient taste updated successfully.")
    else
      render("ingredient_tastes/edit.html.erb")
    end
  end

  def destroy
    @ingredient_taste = IngredientTaste.find(params[:id])
    
    ingredient_id = @ingredient_taste.ingredient_id

    @ingredient_taste.destroy

    if URI(request.referer).path == "/ingredient_tastes/#{@ingredient_taste.id}"
      redirect_to("/", :notice => "Ingredient taste deleted.")
    else
      redirect_to("/ingredients/#{ingredient_id}/edit", :notice => "Ingredient taste deleted.")
    end
  end
end
