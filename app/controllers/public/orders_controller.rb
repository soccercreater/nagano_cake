class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    if params[:order][:address_option] == "0"
      @order = Order.new
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
    elsif params[:order][:address_option] == "1"
      @order = Order.new
      @address = Address.find(params[:order][:address_id])
      @order.name = @address.name
      @order.address = @address.address
      @order.postal_code = @address.postal_code
    elsif params[:order][:address_option] == "2"
      # @order = Order.new
      # @order.name =
      # @order.address =
      # @order.postal_code =
    end
    @order.payment_method = params[:order][:payment_method]
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @shipping_cost = 800
    @total_payment = @shipping_cost + @total
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
    params.require(:order).permit(:payment_method, :address, :postal_code, :name, :payment_method, :total_payment, :shipping_cost, :price)
  end
end
