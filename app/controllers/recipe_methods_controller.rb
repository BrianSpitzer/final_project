class RecipeMethodsController < ApplicationController
  def index
    @recipe_methods = RecipeMethod.all

    render("recipe_methods/index.html.erb")
  end

  def show
    @recipe_method = RecipeMethod.find(params[:id])

    render("recipe_methods/show.html.erb")
  end

  def new
    @recipe_method = RecipeMethod.new

    render("recipe_methods/new.html.erb")
  end

  def create
    @recipe_method = RecipeMethod.new

    @recipe_method.recipe_id = params[:recipe_id]
    @recipe_method.sequence = params[:sequence]
    @recipe_method.description = params[:description]

    save_status = @recipe_method.save

    if save_status == true
      redirect_to("/recipe_methods/#{@recipe_method.id}", :notice => "Recipe method created successfully.")
    else
      render("recipe_methods/new.html.erb")
    end
  end

  def edit
    @recipe_method = RecipeMethod.find(params[:id])

    render("recipe_methods/edit.html.erb")
  end

  def update
    @recipe_method = RecipeMethod.find(params[:id])

    @recipe_method.recipe_id = params[:recipe_id]
    @recipe_method.sequence = params[:sequence]
    @recipe_method.description = params[:description]

    save_status = @recipe_method.save

    if save_status == true
      redirect_to("/recipe_methods/#{@recipe_method.id}", :notice => "Recipe method updated successfully.")
    else
      render("recipe_methods/edit.html.erb")
    end
  end

  def destroy
    @recipe_method = RecipeMethod.find(params[:id])

    @recipe_method.destroy

    if URI(request.referer).path == "/recipe_methods/#{@recipe_method.id}"
      redirect_to("/", :notice => "Recipe method deleted.")
    else
      redirect_to(:back, :notice => "Recipe method deleted.")
    end
  end
end
