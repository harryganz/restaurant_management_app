class Order < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_and_belongs_to_many :items

  #Validations
  validates :party_name, :party_size, :table_number, :user_id, presence: true
  validates :party_size, :table_number, numericality: {
    only_integer: true, greater_than: 0
  }

  #Scopes
  scope :is_complete, -> {where(completed: false)}
  scope :is_incomplete, -> {where(completed: true)}
  scope :by_time, -> {order(created_at: :desc)}
  scope :by_table, -> {order(:table_number)}
end
