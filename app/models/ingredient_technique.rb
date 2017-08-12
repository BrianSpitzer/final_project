# == Schema Information
#
# Table name: ingredient_techniques
#
#  id            :integer          not null, primary key
#  ingredient_id :integer
#  technique_id  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class IngredientTechnique < ApplicationRecord
  # Validations
  validates :ingredient_id, :uniqueness => { :scope => :technique_id }
    
  # Direct associations
  belongs_to :ingredient
  belongs_to :technique
    
  # Indirect associations
    
end
