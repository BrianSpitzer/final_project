# == Schema Information
#
# Table name: pairings
#
#  id                   :integer          not null, primary key
#  first_ingredient_id  :integer
#  second_ingredient_id :integer
#  pairing_strength     :string
#  inverse              :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Pairing < ApplicationRecord

  # Direct associations
  belongs_to :first_ingredient, :class_name => "Ingredient"
  belongs_to :second_ingredient, :class_name => "Ingredient"
  has_many :favorite_pairings, :dependent => :destroy
  has_many :comments, :dependent => :destroy
    
  # Indirect associations
  has_many :users, :through => :favorite_pairings, :source => :user

end
