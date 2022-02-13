class Public::CustomersController < ApplicationController
  def show
     @customer = current_customer
  end

  def edit
     @customer = current_customer
  end

  def update
    @customer = Customer.new
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to my_page_path(current_customer.id)
  end

  def unsubscribe
  end

  def withdraw
  end
   private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana , :postal_code, :address, :telephone_number, :email)
  end
end
