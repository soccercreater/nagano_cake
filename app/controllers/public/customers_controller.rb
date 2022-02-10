class Public::CustomersController < ApplicationController
  def show
     @customer = Customer.new
     @customer = current_customer
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
end
