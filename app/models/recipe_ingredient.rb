# == Schema Information
#
# Table name: recipe_ingredients
#
#  id            :integer          not null, primary key
#  recipe_id     :integer
#  ingredient_id :integer
#  quantity      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class RecipeIngredient < ApplicationRecord
  
  # Direct associations
  belongs_to :ingredient
  belongs_to :recipe
  
  # Indirect associations
  
end
