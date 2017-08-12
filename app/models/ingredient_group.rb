# == Schema Information
#
# Table name: ingredient_groups
#
#  id            :integer          not null, primary key
#  name          :string
#  ingredient_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class IngredientGroup < ApplicationRecord
  # Validations
  
  # Direct associations
  belongs_to :ingredient
  
  # Indirect associations
  
end
