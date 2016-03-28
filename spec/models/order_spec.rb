require 'rails_helper'

RSpec.describe Order, type: :model do
  user = User.create!(name: "Julio", role: "employee", password: "test")
  order1 = user.orders.new(party_name: "Jones", party_size: 5, table_number: 10)

  it "creates a new order" do
    expect(order1.save!).to be_truthy
  end

  it "edits an existing order" do
    order1.party_name = "Donner"
    order1.save!
    expect(order1.party_name).to eq("Donner")
  end

  it "removes an existing order" do
    expect(order1.destroy!).to be_truthy
  end
end
