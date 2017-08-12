# == Schema Information
#
# Table name: favorite_pairings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  pairing_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FavoritePairing < ApplicationRecord
  # Validations
  validates :user_id, :uniqueness => { :scope => :pairing_id }
  
  # Direct associations
  belongs_to :pairing
  belongs_to :user
  
  # Indirect associations
  
end
