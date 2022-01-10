class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.integer :price

      t.timestamps
    end
    add_foreign_key :users, column: :user_id
  end
end
