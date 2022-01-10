class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time
      t.integer :coocking_time
      t.string :description
      t.boolean :public
      
      t.timestamps
    end
    add_foreign_key :users, column: :user_id
  end
end
