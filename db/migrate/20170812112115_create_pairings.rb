class CreatePairings < ActiveRecord::Migration[5.0]
  def change
    create_table :pairings do |t|
      t.integer :first_ingredient_id
      t.integer :second_ingredient_id
      t.string :pairing_strength
      t.boolean :inverse

      t.timestamps

    end
  end
end
