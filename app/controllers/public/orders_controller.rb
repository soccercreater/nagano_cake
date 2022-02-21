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
      @order = Order.new(order_params)
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
    #ordr ＝order_details
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @orderdetail = OrderDetail.new
      @orderdetail.item_id = cart_item.item_id
      @orderdetail.order_id = @order.id
      @orderdetail.amount = cart_item.amount
      @orderdetail.price = (cart_item.item.price * 1.1).floor
      @orderdetail.save
    end
      @cart_items.destroy_all
      redirect_to complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @orders = current_customer.orders
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @cart_items = current_customer.cart_items
    @total = @order_details.inject(0) { |sum, item| sum + item.sum_of_price }
    @shipping_cost = 800
    @total_payment = @shipping_cost + @total
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name, :total_payment, :shipping_cost, :price, :created_at)
  end
end
