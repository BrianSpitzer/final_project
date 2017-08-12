# == Schema Information
#
# Table name: tastes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Taste < ApplicationRecord
  
  # Direct associations
  has_many :ingredient_tastes, :dependent => :destroy
  
  # Indirect associations
  has_many :ingredients, :through => :ingredient_tastes, :source => :ingredient
  
end
