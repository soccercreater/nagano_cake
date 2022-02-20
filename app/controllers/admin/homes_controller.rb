class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    # @orders = Order.page(params[:page])

    # @cart_items =
    # @customer = customer.first_name + customer.last_name


  end

# private
#   def
#   end
end
