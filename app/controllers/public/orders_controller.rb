class Public::OrdersController < ApplicationController
  def new
    @order = Order.all
  end

  def index
  end

  def show
  end

  def confirm
    @orders = current_customer.orders
    @order = current_customer.orders.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name+current_customer.first_name
    @order.postage = 800
    @total_amount = 0
    @order.save
  end

  def finish
  end

  def create
  end

  private

  def order_params
      params.require(:order).permit(:postal_code, :address, :name, :total_amount, :postage, :payment, :customer_id)
  end

end
