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
item3 = Item.create!(name: "Fried Clams",
  category: "appetizer",
  description: "Clams fried in our world famous batter",
  price: 7.00)
item3 = Item.create!(name: "Ceasar Salad",
  category: "salad",
  description: "A classic ceasar salad with chicken and croutons",
  price: 10.00)
item4 = Item.create!(name: "Mexican Mud Slinger",
  category: "beverage",
  description: "Hot Cocoa, Jalepenos, and espresso together." +
  " What could go wrong?",
  price: 5.50)
item5 = Item.create(name: "Chocolate Lava Cake",
  category: "dessert", description: "Our take on a classic. With whole-wheat flour, dark chocolate and" +
  " milk chocolate syrup.",
  price: 10.00)

order1 = Order.new(party_name: "Donner", party_size: 8,
  table_number: 5, special: "No Peanuts", user_id: user2.id)
order2 = Order.new(party_name: "Jones", party_size: 3,
  table_number: 2, user_id: user1.id, completed: true)

order1.items << item1
order1.items << item2
order1.items << item4

order1.save!

order2.items << item1
order2.items << item3
order2.items << item5

order2.save!
