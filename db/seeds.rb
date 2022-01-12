# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Rupert', email: 'rupert@gmail.com', password: '1234567')
Food.create(user_id: 1, name: 'Apple', measurement_unit: 'grams', price: 5)
Food.create(user_id: 1, name: 'orange', measurement_unit: 'grams', price: 3)