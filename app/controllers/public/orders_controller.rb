class Public::OrdersController < ApplicationController
  def new
    @order = Order.all
  end

  def index
    @orders = current_customer.orders.page(params[:page]).per(8)
    @total = 0
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @total = 0

  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name+current_customer.last_name
    @order.postage = 800
    @total_amount = 0
    @billing = 0
  end

  def finish
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save

      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.quantity = cart_item.amount
        order_detail.tax_price = cart_item.item.price * 1.1
        order_detail.save
      end
      redirect_to orders_finish_path
      cart_items.destroy_all

    else
      @order = Order.all
      render :new
    end
  end

  private

  def order_params
      params.require(:order).permit(:postal_code, :address, :name, :total_amount, :postage, :payment, :customer_id)
  end

  def order_detail_params
      params.require(:order_detail).permit(:order_id, :item_id, :quantity, :tax_price)
  end

end
