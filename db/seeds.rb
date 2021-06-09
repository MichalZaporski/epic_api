# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.create(name: 'Tigris restaurant', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in ante id est lobortis pellentesque.', city: 'Poznań', street: 'Łąkowa', street_number: '2', phone_number: '789456789')
Restaurant.create(name: 'Panda restaurant', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in ante id est lobortis pellentesque.', city: 'Stęszew', street: 'Niebieska', street_number: '1', phone_number: '456123456')
Restaurant.create(name: 'Asia restaurant', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in ante id est lobortis pellentesque.', city: 'Stęszew', street: 'Czerwona', street_number: '222', phone_number: '789456123')
Restaurant.create(name: 'Polska restaurant', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in ante id est lobortis pellentesque.', city: 'Poznań', street: 'Zielona', street_number: '23f', phone_number: '789456789')
Restaurant.create(name: 'Oriental restaurant', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in ante id est lobortis pellentesque.', city: 'Poznań', street: 'Łąkowa', street_number: '12', phone_number: '333666999')

Category.create

Course.create(name: 'Pizza test', availability: true, cate)