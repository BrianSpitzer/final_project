class IngredientTechniquesController < ApplicationController
  def index
    @ingredient_techniques = IngredientTechnique.all

    render("ingredient_techniques/index.html.erb")
  end

  def show
    @ingredient_technique = IngredientTechnique.find(params[:id])

    render("ingredient_techniques/show.html.erb")
  end

  def new
    @ingredient_technique = IngredientTechnique.new

    render("ingredient_techniques/new.html.erb")
  end

  def create
    @ingredient_technique = IngredientTechnique.new

    @ingredient_technique.ingredient_id = params[:ingredient_id]
    @ingredient_technique.technique_id = params[:technique_id]

    save_status = @ingredient_technique.save

    if save_status == true
      redirect_to("/ingredients/#{@ingredient_technique.ingredient_id}/edit", :notice => "Ingredient technique created successfully.")
    else
      render("ingredient_techniques/new.html.erb")
    end
  end

  def edit
    @ingredient_technique = IngredientTechnique.find(params[:id])

    render("ingredient_techniques/edit.html.erb")
  end

  def update
    @ingredient_technique = IngredientTechnique.find(params[:id])

    @ingredient_technique.ingredient_id = params[:ingredient_id]
    @ingredient_technique.technique_id = params[:technique_id]

    save_status = @ingredient_technique.save

    if save_status == true
      redirect_to("/ingredient_techniques/#{@ingredient_technique.id}", :notice => "Ingredient technique updated successfully.")
    else
      render("ingredient_techniques/edit.html.erb")
    end
  end

  def destroy
    @ingredient_technique = IngredientTechnique.find(params[:id])
    
    ingredient_id = @ingredient_technique.ingredient_id

    @ingredient_technique.destroy

    if URI(request.referer).path == "/ingredient_techniques/#{@ingredient_technique.id}"
      redirect_to("/", :notice => "Ingredient technique deleted.")
    else
      redirect_to("/ingredients/#{ingredient_id}/edit", :notice => "Ingredient technique deleted.")
    end
  end
end
