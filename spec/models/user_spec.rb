require 'rails_helper'

RSpec.describe User, type: :model do
  harry = User.new(name: "Harry",
  password_digest: "password", role: "employee")

  it "creates a new user" do
    expect(harry.save).to be_truthy
  end

  it "edits an existing user" do
    expect(harry.role).to eq("employee")

    harry.role = "manager"

    harry.save!

    expect(harry.role).to eq("manager")
  end

  it "removes an existing user" do

    expect(harry.destroy!).to be_truthy
  end

  it "throws an validation error if user doesn't have a name" do
    user = User.new(role: "employee", password_digest: "password")
    expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "throws a validation error if user doesn't have a role" do
    user = User.new(name: "user", password_digest: "password")
    expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "throws a validation error if user has a role which is not employee or manager" do
    user = User.new(role: "invalid", name: "user", password_digest: "password")
    expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "lists all the orders for a user" do
    expect(harry.orders).to eq([])
  end

  it 'has secure password' do
    user = User.new(name: 'John', role: "manager")
    user.password = "secure_password"
    user.save!

    expect(user.authenticate("wrong")).to be_falsy
    expect(user.authenticate("secure_password")).to be_truthy
  end

end
