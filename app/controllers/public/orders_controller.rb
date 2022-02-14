class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to complete_path
  end

  def index
     @order = current_customer.order
  end

  def show
  end
  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name)
  end
end
