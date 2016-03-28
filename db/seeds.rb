# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create!(name: "Harry", role: "manager", password: "test")
user2 = User.create!(name: "John", role: "employee", password: "test")

item1 = Item.create!(name: "Penne Vodka",
  category: "entree",
  description: "Penne in our homemade vodka sauce",
  price: 11.00)
item2 = Item.create!(name: "Jalapeno Poppers",
  category: "appetizer",
  description: "Seasoned beef baked in jalapeno peppers",
  price: 8.00)

order1 = Order.new(party_name: "Donner", party_size: 8,
  table_number: 5, special: "No Peanuts", user_id: user2.id)
order1.items << item1
order1.items << item2

order1.save!
