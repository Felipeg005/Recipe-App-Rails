class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.integer :user_id
      t.string :name
      t.string :measurement_unit
      t.integer :price

      t.timestamps
    end
    add_foreign_key :foods, :users, column: :user_id
  end
end
