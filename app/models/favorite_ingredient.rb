# == Schema Information
#
# Table name: favorite_ingredients
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  ingredient_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class FavoriteIngredient < ApplicationRecord
  
  # Direct associations
  belongs_to :ingredient
  belongs_to :user
  
  # Indirect associations
  
  
end
