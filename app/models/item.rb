class Item < ActiveRecord::Base
  #Associations
  has_and_belongs_to_many :orders

  #Validations
  validates :name, :description, :category, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :category, inclusion: {
    in: %w(appetizer entree salad beverage dessert)
  }

  #Scopes
  scope :by_name, -> {order(:name)}
  scope :in_category, -> (cat) {where(category: cat)}
  scope :with_ids, -> (ids) {where("id IN (?)", ids)}
end
