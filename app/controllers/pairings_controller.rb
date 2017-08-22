require 'unirest'

class PairingsController < ApplicationController
  def index
    @pairings = Pairing.all

    render("pairings/index.html.erb")
  end

  def show
    @pairing = Pairing.find(params[:id])

    #Load recipe links from Food2Fork
    response = Unirest.get "https://community-food2fork.p.mashape.com/search?key=e76656b4ddc922e481faa025ec00cb51&q="+@pairing.first_ingredient.name.gsub(" ","+")+","+@pairing.second_ingredient.name.gsub(" ","+"),
        headers:{
                    "X-Mashape-Key" => "eZppqF5VZOmshsgoZVetyK5rAfxQp1Zx2j2jsnOyULlWeaufec",
                    "Accept" => "application/json"
                }
    @recipe_count = response.body["count"]
    @recipe_list = response.body["recipes"]  

    render("pairings/show.html.erb")
  end

  def new
    @pairing = Pairing.new

    render("pairings/new.html.erb")
  end

  def create
    @pairing = Pairing.new

    @pairing.first_ingredient_id = params[:first_ingredient_id]
    @pairing.second_ingredient_id = params[:second_ingredient_id]
    @pairing.pairing_strength = params[:pairing_strength]
    @pairing.inverse = params[:inverse]
    @pairing.user_id = current_user.id

    save_status = @pairing.save

    if save_status == true
      redirect_to("/pairings/#{@pairing.id}", :notice => "Pairing created successfully.")
    else
      render("pairings/new.html.erb")
    end
  end

  def edit
    @pairing = Pairing.find(params[:id])

    render("pairings/edit.html.erb")
  end

  def update
    @pairing = Pairing.find(params[:id])

    @pairing.first_ingredient_id = params[:first_ingredient_id]
    @pairing.second_ingredient_id = params[:second_ingredient_id]
    @pairing.pairing_strength = params[:pairing_strength]
    @pairing.inverse = params[:inverse]

    save_status = @pairing.save

    if save_status == true
      redirect_to("/pairings/#{@pairing.id}", :notice => "Pairing updated successfully.")
    else
      render("pairings/edit.html.erb")
    end
  end

  def destroy
    @pairing = Pairing.find(params[:id])

    @pairing.destroy

    if URI(request.referer).path == "/pairings/#{@pairing.id}"
      redirect_to("/", :notice => "Pairing deleted.")
    else
      redirect_to(:back, :notice => "Pairing deleted.")
    end
  end
end
