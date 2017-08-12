# == Schema Information
#
# Table name: ingredient_tastes
#
#  id            :integer          not null, primary key
#  ingredient_id :integer
#  taste_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class IngredientTaste < ApplicationRecord
  
  # Direct associations
  belongs_to :ingredient
  belongs_to :taste
  
  # Indirect associations
  
end
