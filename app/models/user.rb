class User < ActiveRecord::Base
  # Associations
  has_many :orders
  # Vaidations
  has_secure_password
  validates :name, :role, presence: true
  validates :role, inclusion: { in: %w(employee manager) }
end
