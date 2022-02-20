class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    # @orders = Order.page(params[:page])

    # @cart_items =
    @customer = Customer.all
    @order_details = OrderDetail.all

    # @customer = @customer.first_name


  end

private
  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name, :total_payment, :shipping_cost, :price, :created_at)
  end
end
