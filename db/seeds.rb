# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#user
admin = User.create(email: "admin@goodhairday.com", username: "admin",  password: "adminpassword")

#category
shampoo = Category.create(name: "Shampoo")
conditioner = Category.create(name: "Conditioner")
deep_conditioner = Category.create(name: "Deep Conditioner")
oil = Category.create(name: "Oil")
hair_mousse = Category.create(name: "Hair Mousse")
heat_protectant = Category.create(name: "Heat Protectant")