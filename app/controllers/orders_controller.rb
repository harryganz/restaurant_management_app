class OrdersController < ApplicationController
  def index
    @incomplete_orders = Order.is_incomplete.by_time
    @complete_orders = Order.is_complete.by_table
  end
end
