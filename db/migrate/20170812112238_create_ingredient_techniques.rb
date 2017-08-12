class CreateIngredientTechniques < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredient_techniques do |t|
      t.integer :ingredient_id
      t.integer :technique_id

      t.timestamps

    end
  end
end
