class Order < ActiveRecord::Base
  # Associations
  belongs_to :user
end
