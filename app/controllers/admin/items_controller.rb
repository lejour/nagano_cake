class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def index

  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
