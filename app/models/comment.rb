# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  ingredient_id :integer
#  pairing_id    :integer
#  recipe_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Comment < ApplicationRecord
 
  # Validations
  
  # Direct associations
  belongs_to :ingredient, :required => false
  belongs_to :pairing, :required => false
  belongs_to :user
  belongs_to :recipe, :required => false
  
  # Indirect associations
  
end
