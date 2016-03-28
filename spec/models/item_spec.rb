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
end
