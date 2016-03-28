require 'rails_helper'

RSpec.describe Item, type: :model do
  item1 = Item.new(name: "Penne Farfala",
  description: "Penne pasta with farfala pasta",
  price: 12.88, category: "entree")

  it "adds a new item" do
    expect(item1.save!).to be_truthy
  end

  item1.save!

  it "edits an existing item" do
    item1.name = "Penne Vodka"
    item1.save!
    expect(item1.name).to eq("Penne Vodka")
  end

  it "removes an existing item" do
    expect(item1.destroy).to be_truthy
  end

  it "throws error if name missing" do
    item = Item.new(
    description: "Penne pasta with farfala pasta",
    price: 12.88, category: "entree")

    expect{item.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "throws error if description missing" do
    item = Item.new(name: "Penne Farfala",
    price: 12.88, category: "entree")
    expect{item.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "throws error if category missing" do
    item = Item.new(name: "Penne Farfala",
    description: "Penne pasta with farfala pasta",
    price: 12.88)
    expect{item.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "throws error if price missing" do
    item = Item.new(name: "Penne Farfala",
    description: "Penne pasta with farfala pasta",
    category: "entree")
    expect{item.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "throws error if price not greater than 0" do
    item = Item.new(name: "Penne Farfala",
    description: "Penne pasta with farfala pasta",
    price: -1, category: "entree")
    expect{item.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'throws error if category no appetizer, entree, salad, soup, beverage, '\
  'or dessert' do
    item = Item.new(name: "Penne Farfala",
    description: "Penne pasta with farfala pasta",
    price: 12.88, category: "bees")
    expect{item.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'lists all the orders that an item belongs to' do
    item = Item.create!(name: "Penne Farfala",
    description: "Penne pasta with farfala pasta",
    price: 12.88, category: "entree")

    expect(item.orders).to eq([])
  end
end
