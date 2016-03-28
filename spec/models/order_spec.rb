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

  it "throws error if party_name missing" do
    order = user.orders.new(party_size: 5, table_number: 10)
    expect{order.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "throws an error if party_size missing" do
      order = user.orders.new(party_name: "Jones", table_number: 10)
      expect{order.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "throws an error if table_number missing" do
      order = user.orders.new(party_name: "Jones", party_size: 5)
      expect{order.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "throws an error if user_id missing" do
      order = Order.new(party_name: "Jones", party_size: 5, table_number: 10)
      expect{order.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "throws an error if party_size is not greater than 0" do
      order = user.orders.new(party_name: "Jones", party_size: 0, table_number: 10)
      expect{order.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "throws an error of table_number is not greater than 0" do
      order = user.orders.new(party_name: "Jones", party_size: 5, table_number: 0)
      expect{order.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "throws an error if table_number is not an integer" do
      order = user.orders.new(party_name: "Jones", party_size: 5, table_number: 1.5)
      expect{order.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "throws an error if party_size is not an integer" do
    order = user.orders.new(party_name: "Jones", party_size: 5.5, table_number: 1)
    expect{order.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
