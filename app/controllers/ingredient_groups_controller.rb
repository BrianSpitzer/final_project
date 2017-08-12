class IngredientGroupsController < ApplicationController
  def index
    @ingredient_groups = IngredientGroup.all

    render("ingredient_groups/index.html.erb")
  end

  def show
    @ingredient_group = IngredientGroup.find(params[:id])

    render("ingredient_groups/show.html.erb")
  end

  def new
    @ingredient_group = IngredientGroup.new

    render("ingredient_groups/new.html.erb")
  end

  def create
    @ingredient_group = IngredientGroup.new

    @ingredient_group.name = params[:name]
    @ingredient_group.ingredient_id = params[:ingredient_id]

    save_status = @ingredient_group.save

    if save_status == true
      redirect_to("/ingredient_groups/#{@ingredient_group.id}", :notice => "Ingredient group created successfully.")
    else
      render("ingredient_groups/new.html.erb")
    end
  end

  def edit
    @ingredient_group = IngredientGroup.find(params[:id])

    render("ingredient_groups/edit.html.erb")
  end

  def update
    @ingredient_group = IngredientGroup.find(params[:id])

    @ingredient_group.name = params[:name]
    @ingredient_group.ingredient_id = params[:ingredient_id]

    save_status = @ingredient_group.save

    if save_status == true
      redirect_to("/ingredient_groups/#{@ingredient_group.id}", :notice => "Ingredient group updated successfully.")
    else
      render("ingredient_groups/edit.html.erb")
    end
  end

  def destroy
    @ingredient_group = IngredientGroup.find(params[:id])

    @ingredient_group.destroy

    if URI(request.referer).path == "/ingredient_groups/#{@ingredient_group.id}"
      redirect_to("/", :notice => "Ingredient group deleted.")
    else
      redirect_to(:back, :notice => "Ingredient group deleted.")
    end
  end
end
