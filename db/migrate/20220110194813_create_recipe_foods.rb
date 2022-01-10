class CreateRecipeFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_foods do |t|
      t.string :quantity

      t.timestamps
    end
    add_foreign_key :recipes, column: :recipe_id
    add_foreign_key :foods, column: :food_id
  end
end
