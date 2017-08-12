class CreateFavoritePairings < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_pairings do |t|
      t.integer :user_id
      t.integer :pairing_id

      t.timestamps

    end
  end
end
