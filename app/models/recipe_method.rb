# == Schema Information
#
# Table name: recipe_methods
#
#  id          :integer          not null, primary key
#  recipe_id   :integer
#  sequence    :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RecipeMethod < ApplicationRecord
  
  # Direct associations
  belongs_to :recipe
  
  # Indirect associations
  
end
