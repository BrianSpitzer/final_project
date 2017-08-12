class CreateRecipeMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_methods do |t|
      t.integer :recipe_id
      t.string :sequence
      t.text :description

      t.timestamps

    end
  end
end
