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
end
