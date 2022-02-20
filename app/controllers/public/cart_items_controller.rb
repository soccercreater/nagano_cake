class Public::CartItemsController < ApplicationController
  def index
   @cart_items= current_customer.cart_items.all
   @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def update
    @cart_items = current_customer.cart_items.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
   @cart_items = CartItem.find(params[:id])
   @cart_items.destroy
   redirect_to cart_items_path
  end

  def destroy_all
   @cart_items = CartItem.all
   @cart_items.destroy_all
   redirect_to cart_items_path
  end

  def create
    @cart_items = CartItem.new(cart_item_params)
    @cart_items.customer_id = current_customer.id
    @cart_items.save
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :price, :customer_id, :amount)
  end
end
