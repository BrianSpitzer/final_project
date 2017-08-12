Rails.application.routes.draw do

  root "ingredients#index"

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

  # Routes for the Taste resource:
  # CREATE
  get "/tastes/new", :controller => "tastes", :action => "new"
  post "/create_taste", :controller => "tastes", :action => "create"

  # READ
  get "/tastes", :controller => "tastes", :action => "index"
  get "/tastes/:id", :controller => "tastes", :action => "show"

  # UPDATE
  get "/tastes/:id/edit", :controller => "tastes", :action => "edit"
  post "/update_taste/:id", :controller => "tastes", :action => "update"

  # DELETE
  get "/delete_taste/:id", :controller => "tastes", :action => "destroy"
  #------------------------------

  # Routes for the Favorite_recipe resource:
  # CREATE
  get "/favorite_recipes/new", :controller => "favorite_recipes", :action => "new"
  post "/create_favorite_recipe", :controller => "favorite_recipes", :action => "create"

  # READ
  get "/favorite_recipes", :controller => "favorite_recipes", :action => "index"
  get "/favorite_recipes/:id", :controller => "favorite_recipes", :action => "show"

  # UPDATE
  get "/favorite_recipes/:id/edit", :controller => "favorite_recipes", :action => "edit"
  post "/update_favorite_recipe/:id", :controller => "favorite_recipes", :action => "update"

  # DELETE
  get "/delete_favorite_recipe/:id", :controller => "favorite_recipes", :action => "destroy"
  #------------------------------

  # Routes for the Recipe_method resource:
  # CREATE
  get "/recipe_methods/new", :controller => "recipe_methods", :action => "new"
  post "/create_recipe_method", :controller => "recipe_methods", :action => "create"

  # READ
  get "/recipe_methods", :controller => "recipe_methods", :action => "index"
  get "/recipe_methods/:id", :controller => "recipe_methods", :action => "show"

  # UPDATE
  get "/recipe_methods/:id/edit", :controller => "recipe_methods", :action => "edit"
  post "/update_recipe_method/:id", :controller => "recipe_methods", :action => "update"

  # DELETE
  get "/delete_recipe_method/:id", :controller => "recipe_methods", :action => "destroy"
  #------------------------------

  # Routes for the Recipe_ingredient resource:
  # CREATE
  get "/recipe_ingredients/new", :controller => "recipe_ingredients", :action => "new"
  post "/create_recipe_ingredient", :controller => "recipe_ingredients", :action => "create"

  # READ
  get "/recipe_ingredients", :controller => "recipe_ingredients", :action => "index"
  get "/recipe_ingredients/:id", :controller => "recipe_ingredients", :action => "show"

  # UPDATE
  get "/recipe_ingredients/:id/edit", :controller => "recipe_ingredients", :action => "edit"
  post "/update_recipe_ingredient/:id", :controller => "recipe_ingredients", :action => "update"

  # DELETE
  get "/delete_recipe_ingredient/:id", :controller => "recipe_ingredients", :action => "destroy"
  #------------------------------

  # Routes for the Recipe resource:
  # CREATE
  get "/recipes/new", :controller => "recipes", :action => "new"
  post "/create_recipe", :controller => "recipes", :action => "create"

  # READ
  get "/recipes", :controller => "recipes", :action => "index"
  get "/recipes/:id", :controller => "recipes", :action => "show"

  # UPDATE
  get "/recipes/:id/edit", :controller => "recipes", :action => "edit"
  post "/update_recipe/:id", :controller => "recipes", :action => "update"

  # DELETE
  get "/delete_recipe/:id", :controller => "recipes", :action => "destroy"
  #------------------------------

  # Routes for the Comment resource:
  # CREATE
  get "/comments/new", :controller => "comments", :action => "new"
  post "/create_comment", :controller => "comments", :action => "create"

  # READ
  get "/comments", :controller => "comments", :action => "index"
  get "/comments/:id", :controller => "comments", :action => "show"

  # UPDATE
  get "/comments/:id/edit", :controller => "comments", :action => "edit"
  post "/update_comment/:id", :controller => "comments", :action => "update"

  # DELETE
  get "/delete_comment/:id", :controller => "comments", :action => "destroy"
  #------------------------------

  # Routes for the Ingredient_group resource:
  # CREATE
  get "/ingredient_groups/new", :controller => "ingredient_groups", :action => "new"
  post "/create_ingredient_group", :controller => "ingredient_groups", :action => "create"

  # READ
  get "/ingredient_groups", :controller => "ingredient_groups", :action => "index"
  get "/ingredient_groups/:id", :controller => "ingredient_groups", :action => "show"

  # UPDATE
  get "/ingredient_groups/:id/edit", :controller => "ingredient_groups", :action => "edit"
  post "/update_ingredient_group/:id", :controller => "ingredient_groups", :action => "update"

  # DELETE
  get "/delete_ingredient_group/:id", :controller => "ingredient_groups", :action => "destroy"
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

  # Routes for the Technique resource:
  # CREATE
  get "/techniques/new", :controller => "techniques", :action => "new"
  post "/create_technique", :controller => "techniques", :action => "create"

  # READ
  get "/techniques", :controller => "techniques", :action => "index"
  get "/techniques/:id", :controller => "techniques", :action => "show"

  # UPDATE
  get "/techniques/:id/edit", :controller => "techniques", :action => "edit"
  post "/update_technique/:id", :controller => "techniques", :action => "update"

  # DELETE
  get "/delete_technique/:id", :controller => "techniques", :action => "destroy"
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

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
