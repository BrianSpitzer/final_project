class FavoritePairingsController < ApplicationController
  def index
    @favorite_pairings = FavoritePairing.all

    render("favorite_pairings/index.html.erb")
  end

  def show
    @favorite_pairing = FavoritePairing.find(params[:id])

    render("favorite_pairings/show.html.erb")
  end

  def new
    @favorite_pairing = FavoritePairing.new

    render("favorite_pairings/new.html.erb")
  end

  def create
    @favorite_pairing = FavoritePairing.new

    @favorite_pairing.user_id = current_user.id
    @favorite_pairing.pairing_id = params[:pairing_id]
    
    ingredient_id = params[:ingredient_id]

    save_status = @favorite_pairing.save

    if save_status == true
      redirect_to("/ingredients/"+ingredient_id.to_s, :notice => "Favorite pairing created successfully.")
    else
      render("favorite_pairings/new.html.erb")
    end
  end

  def edit
    @favorite_pairing = FavoritePairing.find(params[:id])

    render("favorite_pairings/edit.html.erb")
  end

  def update
    @favorite_pairing = FavoritePairing.find(params[:id])

    @favorite_pairing.user_id = params[:user_id]
    @favorite_pairing.pairing_id = params[:pairing_id]

    save_status = @favorite_pairing.save

    if save_status == true
      redirect_to("/favorite_pairings/#{@favorite_pairing.id}", :notice => "Favorite pairing updated successfully.")
    else
      render("favorite_pairings/edit.html.erb")
    end
  end

  def destroy
    @favorite_pairing = FavoritePairing.find(params[:id])
    ingredient_id = params[:ingredient_id]

    @favorite_pairing.destroy

    if URI(request.referer).path == "/favorite_pairings/#{@favorite_pairing.id}"
      redirect_to("/", :notice => "Favorite pairing deleted.")
    else
      redirect_to("/ingredients/"+ingredient_id.to_s, :notice => "Favorite pairing deleted.")
    end
  end
end
