require 'open-uri'
require 'unirest'

class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all.order(:name)

    render("ingredients/index.html.erb")
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @ndbno = "not on file"
    @calories = 0
    @sugars = 0
    @fat = 0
    @carbs = 0
    @pairing = Pairing.new

    # Load nutritional information from USDA
    parsed_search = JSON.parse(open("https://api.nal.usda.gov/ndb/search/?format=json&q="+@ingredient.name+"&sort=n&max=250&offset=0&ds=Standard%20Reference&api_key=7wmIYyJAsQ4O7ZGLqgMqksUyjvDHE2j9L0GPqrXM").read)

    if parsed_search["list"].present?
      @ndbno = parsed_search["list"]["item"][0]["ndbno"]
      
      parsed_nutrition = JSON.parse(open("https://api.nal.usda.gov/ndb/nutrients/?format=json&api_key=7wmIYyJAsQ4O7ZGLqgMqksUyjvDHE2j9L0GPqrXM&nutrients=205&nutrients=204&nutrients=208&nutrients=269&ndbno="+@ndbno).read)
      
      foods = parsed_nutrition.dig("report","foods")
      
      if foods.count >= 1
        @serving_grams = foods[0]["weight"]
        @serving_description = foods[0]["measure"]
        
        nutrients = foods[0]["nutrients"]
        
        nutrients.each do |nutrient|
          if nutrient["nutrient"] == "Energy"
            @calories = nutrient["value"]
          elsif nutrient["nutrient"] == "Sugars, total"
            @sugars = nutrient["value"]
          elsif nutrient["nutrient"] == "Total lipid (fat)"
            @fat = nutrient["value"]
          elsif nutrient["nutrient"] == "Carbohydrate, by difference"
            @carbs = nutrient["value"]
          end
        end
      else
        @ndbno = "not on file"
      end
    end
    
    #Load recipe links from Food2Fork
    response = Unirest.get "https://community-food2fork.p.mashape.com/search?key=e76656b4ddc922e481faa025ec00cb51&q="+@ingredient.name.gsub(" ","+"),
        headers:{
                    "X-Mashape-Key" => "eZppqF5VZOmshsgoZVetyK5rAfxQp1Zx2j2jsnOyULlWeaufec",
                    "Accept" => "application/json"
                }
    @recipe_count = response.body["count"]
    @recipe_list = response.body["recipes"]

    render("ingredients/show.html.erb")
  end

  def new
    @ingredient = Ingredient.new

    render("ingredients/new.html.erb")
  end

  def create
    @ingredient = Ingredient.new

    @ingredient.name = params[:name].downcase
    @ingredient.weight = params[:weight]
    @ingredient.volume = params[:volume]
    @ingredient.season = params[:season]
    @ingredient.function = params[:function]
    @ingredient.form = params[:form]
    @ingredient.user_id = current_user.id

    save_status = @ingredient.save

    if save_status == true
      redirect_to("/ingredients/#{@ingredient.id}", :notice => "Ingredient created successfully.")
    else
      render("ingredients/new.html.erb")
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    @ingredient_taste = IngredientTaste.new
    @ingredient_technique = IngredientTechnique.new
    
    render("ingredients/edit.html.erb")
  end

  def update
    @ingredient = Ingredient.find(params[:id])

    @ingredient.name = params[:name]
    @ingredient.weight = params[:weight]
    @ingredient.volume = params[:volume]
    @ingredient.season = params[:season]
    @ingredient.function = params[:function]
    @ingredient.form = params[:form]

    save_status = @ingredient.save

    if save_status == true
      redirect_to("/ingredients/#{@ingredient.id}", :notice => "Ingredient updated successfully.")
    else
      render("ingredients/edit.html.erb")
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])

    @ingredient.destroy

    if URI(request.referer).path == "/ingredients/#{@ingredient.id}"
      redirect_to("/", :notice => "Ingredient deleted.")
    else
      redirect_to("/", :notice => "Ingredient deleted.")
    end
  end
end
