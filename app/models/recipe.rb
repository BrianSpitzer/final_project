# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ApplicationRecord
  
  # Direct associations
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  has_many :recipe_ingredients, :dependent => :destroy
  has_many :recipe_methods, :dependent => :destroy
  has_many :comments, :dependent => :nullify
  has_many :favorite_recipes, :dependent => :destroy
  
  # Indirect associations
  
end
