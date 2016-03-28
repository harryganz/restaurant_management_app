class OrdersController < ApplicationController
  def index
    @incomplete_orders = Order.is_incomplete.by_time
    @complete_orders = Order.is_complete.by_table
  end

  def new
    @order = Order.new
    @users = User.all
    @user = User.find(session[:current_user_id])
    @items = Item.all.by_name
  end

  def create
    @order = Order.new(order_params)
    @items = Item.with_ids(params[:item_ids])

    @items.each do |item|
      @order.items << item
    end

    if @order.save
      redirect_to orders_path
    else
      redirect_to new_order_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private
   def order_params
     params.require(:order).permit(:party_name, :party_size,
     :table_number, :user_id, :special)
   end
end
