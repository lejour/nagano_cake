class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.all
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_
  end
  
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
