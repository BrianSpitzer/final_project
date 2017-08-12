class CreateIngredientGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredient_groups do |t|
      t.string :name
      t.integer :ingredient_id

      t.timestamps

    end
  end
end
