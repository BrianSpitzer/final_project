class RemoveInverseFromPairings < ActiveRecord::Migration[5.1]
  def change
    remove_column :pairings, :inverse, :boolean
  end
end
