class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.all
    @order = Order.find(params[:id])
    @orders = current_customer.cart_items
    # @cart_item = current_customer.cart_item
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @shipping_cost = 800
    @total_payment = @shipping_cost + @total
  end

  def update
  end
end
