# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string
#  weight     :string
#  volume     :string
#  season     :string
#  function   :string
#  form       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ingredient < ApplicationRecord

  # Validations
  validates :name, :presence => true, :uniqueness => true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :weight, inclusion: { in: %w(light light-medium medium medium-heavy heavy), message: "%{value} is not a valid weight" }
  validates :volume, inclusion: { in: %w(quiet quiet-moderate moderate moderate-loud loud quiet-loud), message: "%{value} is not a valid volume" }
  validates :season, inclusion: { in: %w(winter winter-spring spring spring-summer summer summer-autumn autumn autumn-winter year-round), 
    message: "%{value} is not a valid season" }
  validates :function, inclusion: { in: %w(cooling warming heating), message: "%{value} is not a valid function" }
  validates :form, inclusion: { in: %w(wet dry each), message: "%{value} is not a valid form" }
    
  # Direct associations 
  has_many :ingredient_techniques, :dependent => :destroy
  has_many :first_pairings, :class_name => "Pairing", :foreign_key => "first_ingredient_id", :dependent => :destroy
  has_many :second_pairings, :class_name => "Pairing", :foreign_key => "second_ingredient_id", :dependent => :destroy
  has_many :favorite_ingredients, :dependent => :destroy
  has_many :ingredient_groups, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :recipe_ingredients, :dependent => :destroy
  has_many :ingredient_tastes, :dependent => :destroy
  
  #Indirect associations
  has_many :techniques, :through => :ingredient_techniques, :source => :technique
  has_many :tastes, :through => :ingredient_tastes, :source => :taste
  has_many :users, :through => :favorite_ingredients, :source => :user
    
end
