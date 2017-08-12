class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :weight
      t.string :volume
      t.string :season
      t.string :function
      t.string :form

      t.timestamps

    end
  end
end
