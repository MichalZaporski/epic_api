# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
restaurant_1 = Restaurant.create(name: 'Tigris restaurant', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in ante id est lobortis pellentesque.', city: 'Poznań', street: 'Łąkowa', street_number: '2', phone_number: '789456789')
restaurant_2 = Restaurant.create(name: 'Panda restaurant', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in ante id est lobortis pellentesque.', city: 'Stęszew', street: 'Niebieska', street_number: '1', phone_number: '456123456')
restaurant_3 = Restaurant.create(name: 'Asia restaurant', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in ante id est lobortis pellentesque.', city: 'Stęszew', street: 'Czerwona', street_number: '222', phone_number: '789456123')
Restaurant.create(name: 'Polska restaurant', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in ante id est lobortis pellentesque.', city: 'Poznań', street: 'Zielona', street_number: '23f', phone_number: '789456789')
Restaurant.create(name: 'Oriental restaurant', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in ante id est lobortis pellentesque.', city: 'Poznań', street: 'Łąkowa', street_number: '12', phone_number: '333666999')

category_1 = Category.create(category_name: 'Italian')
category_2 = Category.create(category_name: 'Polish')
category_3 = Category.create(category_name: 'French')
category_4 = Category.create(category_name: 'Japanese')

Course.create(name: 'Pizza one', availability: true, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', price: 30, category: category_1, restaurant: restaurant_1)
Course.create(name: 'Pizza two', availability: true, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', price: 20, category: category_1, restaurant: restaurant_1)
Course.create(name: 'Pizza three', availability: true, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', price: 50, category: category_1, restaurant: restaurant_1)
Course.create(name: 'Snakes', availability: true, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', price: 50, category: category_3, restaurant: restaurant_1)
Course.create(name: 'Sushi', availability: true, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', price: 70, category: category_4, restaurant: restaurant_1)

Course.create(name: 'Pizza white', availability: true, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', price: 90, category: category_1, restaurant: restaurant_2)
Course.create(name: 'Pizza orange', availability: true, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', price: 100, category: category_1, restaurant: restaurant_2)
Course.create(name: 'Pizza yellow', availability: true, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', price: 80, category: category_1, restaurant: restaurant_2)
Course.create(name: 'Tomato Soup', availability: true, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', price: 30, category: category_2, restaurant: restaurant_2)
Course.create(name: 'Chicken soup', availability: true, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', price: 30, category: category_2, restaurant: restaurant_2)