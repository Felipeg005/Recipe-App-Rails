class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :name
      t.decimal :preparation_time
      t.decimal :cooking_time
      t.string :description
      t.boolean :public
      
      t.timestamps
    end
    add_foreign_key :recipes, :users, column: :user_id
  end
end
