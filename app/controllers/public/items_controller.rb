class Public::ItemsController < ApplicationController
  def index
   @item = Item.new
   @items = Item.page(params[:page]).per(10)
  end

  def show
   @cart_item = CartItem.new
   @items = Item.find(params[:id])
  end

   private
  def item_params
    params.require(:item).permit(:name, :price, :image_id, :introduction)
  end
end
