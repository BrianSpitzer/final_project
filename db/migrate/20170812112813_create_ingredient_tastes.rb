class CreateIngredientTastes < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredient_tastes do |t|
      t.integer :ingredient_id
      t.integer :taste_id

      t.timestamps

    end
  end
end
