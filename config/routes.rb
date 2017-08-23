Rails.application.routes.draw do

  # Routes for the Ingredient resource:
  # CREATE
  get "/ingredients/new", :controller => "ingredients", :action => "new"
  post "/create_ingredient", :controller => "ingredients", :action => "create"

  # READ
  get "/ingredients", :controller => "ingredients", :action => "index"
  get "/ingredients/:id", :controller => "ingredients", :action => "show"

  # UPDATE
  get "/ingredients/:id/edit", :controller => "ingredients", :action => "edit"
  post "/update_ingredient/:id", :controller => "ingredients", :action => "update"

  # DELETE
  get "/delete_ingredient/:id", :controller => "ingredients", :action => "destroy"
  
  #------------------------------
  
  # Routes for the Ingredient_taste resource:
  # CREATE
  get "/ingredient_tastes/new", :controller => "ingredient_tastes", :action => "new"
  post "/create_ingredient_taste", :controller => "ingredient_tastes", :action => "create"

  # READ
  get "/ingredient_tastes", :controller => "ingredient_tastes", :action => "index"
  get "/ingredient_tastes/:id", :controller => "ingredient_tastes", :action => "show"

  # UPDATE
  get "/ingredient_tastes/:id/edit", :controller => "ingredient_tastes", :action => "edit"
  post "/update_ingredient_taste/:id", :controller => "ingredient_tastes", :action => "update"

  # DELETE
  get "/delete_ingredient_taste/:id", :controller => "ingredient_tastes", :action => "destroy"
  #------------------------------

  # Routes for the Favorite_pairing resource:
  # CREATE
  get "/favorite_pairings/new", :controller => "favorite_pairings", :action => "new"
  post "/create_favorite_pairing", :controller => "favorite_pairings", :action => "create"

  # READ
  get "/favorite_pairings", :controller => "favorite_pairings", :action => "index"
  get "/favorite_pairings/:id", :controller => "favorite_pairings", :action => "show"

  # UPDATE
  get "/favorite_pairings/:id/edit", :controller => "favorite_pairings", :action => "edit"
  post "/update_favorite_pairing/:id", :controller => "favorite_pairings", :action => "update"

  # DELETE
  get "/delete_favorite_pairing/:id", :controller => "favorite_pairings", :action => "destroy"
  #------------------------------

  # Routes for the Favorite_ingredient resource:
  # CREATE
  get "/favorite_ingredients/new", :controller => "favorite_ingredients", :action => "new"
  post "/create_favorite_ingredient", :controller => "favorite_ingredients", :action => "create"

  # READ
  get "/favorite_ingredients", :controller => "favorite_ingredients", :action => "index"
  get "/favorite_ingredients/:id", :controller => "favorite_ingredients", :action => "show"

  # UPDATE
  get "/favorite_ingredients/:id/edit", :controller => "favorite_ingredients", :action => "edit"
  post "/update_favorite_ingredient/:id", :controller => "favorite_ingredients", :action => "update"

  # DELETE
  get "/delete_favorite_ingredient/:id", :controller => "favorite_ingredients", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the Ingredient_technique resource:
  # CREATE
  get "/ingredient_techniques/new", :controller => "ingredient_techniques", :action => "new"
  post "/create_ingredient_technique", :controller => "ingredient_techniques", :action => "create"

  # READ
  get "/ingredient_techniques", :controller => "ingredient_techniques", :action => "index"
  get "/ingredient_techniques/:id", :controller => "ingredient_techniques", :action => "show"

  # UPDATE
  get "/ingredient_techniques/:id/edit", :controller => "ingredient_techniques", :action => "edit"
  post "/update_ingredient_technique/:id", :controller => "ingredient_techniques", :action => "update"

  # DELETE
  get "/delete_ingredient_technique/:id", :controller => "ingredient_techniques", :action => "destroy"
  #------------------------------

  # Routes for the Pairing resource:
  # CREATE
  get "/pairings/new", :controller => "pairings", :action => "new"
  post "/create_pairing", :controller => "pairings", :action => "create"

  # READ
  get "/pairings", :controller => "pairings", :action => "index"
  get "/pairings/:id", :controller => "pairings", :action => "show"

  # UPDATE
  get "/pairings/:id/edit", :controller => "pairings", :action => "edit"
  post "/update_pairing/:id", :controller => "pairings", :action => "update"

  # DELETE
  get "/delete_pairing/:id", :controller => "pairings", :action => "destroy"

  #------------------------------
  
  
  root "ingredients#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
