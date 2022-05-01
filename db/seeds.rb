# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Rupert', email: 'rupert@gmail.com', password: '1234567')
User.create(name: 'Elisa', email: 'elisa@gmail.com', password: '1234567')
Food.create(user_id: 1, name: 'Apple', measurement_unit: 'grams', price: 5)
Food.create(user_id: 1, name: 'Orange', measurement_unit: 'grams', price: 3)
Recipe.create(user_id: 1, name: 'Panna cotta', preparation_time: 1.4, cooking_time: 3, description: 'cook the bread 5 minutes', public: false)
Recipe.create(user_id: 1, name: 'Cheese Cake', preparation_time: 2, cooking_time: 3.1, description: 'cook the cheese 5 minutes', public: true)