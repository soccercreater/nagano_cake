class Admin::CustomersController < ApplicationController
  def index
     @customer = Customer.new
     @customer = Customer.all
     @customers = Customer.page(params[:page])
  end

  def show
     @customer = Customer.new
     @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.new
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :introduction, :price, :genre_id, :is_active, :image, :first_name, :last_name, :first_name_kana, :last_name_kana , :postal_code, :address, :telephone_number, :email)
  end
end
