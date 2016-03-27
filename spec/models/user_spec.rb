require 'rails_helper'

RSpec.describe User, type: :model do
  harry = User.create!(name: "Harry",
  password_digest: "password", role: "employee")

  it "creates a new user" do
    expect(User.where(name: "Harry").first).to eq(harry)
  end

  it "edits an existing user" do
    expect(User.where(name: "Harry").first.role).to eq("employee")

    harry = User.where(name: "Harry").first

    harry.role = "manager"

    harry.save!

    expect(User.where(name: "Harry").first.role).to eq("manager")
  end

  it "removes an existing user" do
    harry = User.where(name: "Harry").first

    harry.destroy!

    expect(User.where(name: "Harry").first).to be_nil
  end

  it "throws an validation error if user doesn't have a name" do
    user = User.new(role: "employee", password_digest: "password")
    expect{user.save}.to raise_error("name cannot be blank")
  end

  it "throws a validation error if user doesn't have a role" do
    user = User.new(name: "user", password_digest: "password")
    expect{user.save}.to raise_error("role cannot be blank")
  end

  it "throws a validation error if user has a role which is not employee or manager" do
    user = User.new(role: "invalid", name: "user", password_digest: "password")
    expect{user.save}.to raise_error("role must be employee or manager")
  end

  it "lists all the orders for a user" do
    expect(harry.orders).to eq([])
  end

end
