# == Schema Information
#
# Table name: pairings
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  first_ingredient_id  :integer
#  second_ingredient_id :integer
#  pairing_strength     :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Pairing < ApplicationRecord
  # Validations
  validates :first_ingredient_id, :uniqueness => { :scope => :second_ingredient_id }
  validates :pairing_strength, inclusion: { in: %w(good better best), message: "%{value} is not a valid strength" }

  # Direct associations
  belongs_to :first_ingredient, :class_name => "Ingredient"
  belongs_to :second_ingredient, :class_name => "Ingredient"
  belongs_to :user
  has_many :favorite_pairings, :dependent => :destroy

  # Indirect associations
  has_many :users, :through => :favorite_pairings, :source => :user

end
