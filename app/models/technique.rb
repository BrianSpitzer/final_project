# == Schema Information
#
# Table name: techniques
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Technique < ApplicationRecord
  # Validations
  validates :name, :presence => true, :uniqueness => true, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters" }
    
  # Direct associations
  has_many :ingredient_techniques, :dependent => :destroy
    
  # Indirect associations
  has_many :ingredients, :through => :ingredient_techniques, :source => :ingredient
    
end
