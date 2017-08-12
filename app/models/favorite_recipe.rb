# == Schema Information
#
# Table name: favorite_recipes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  recipe_id  :integer
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FavoriteRecipe < ApplicationRecord
  # Validations
  validates :user_id, :uniqueness => { :scope => :recipe_id }
  
  # Direct associations
  belongs_to :user
  belongs_to :recipe
  
  # Indirect associations
  
end
