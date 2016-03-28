class Item < ActiveRecord::Base
  #Associations
  #Validations
  validates :name, :description, :category, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :category, inclusion: {
    in: %w(appetizer entree salad beverage dessert)
  }
end
