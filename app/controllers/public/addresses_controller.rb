class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
   @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def update
    @addresses = Address.find(params[:id])
    @addresses.update(address_params)
    redirect_to addresses_path(current_customer.id)
  end

  def destroy
    @addresses = Address.find(params[:id])
    @addresses.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end
end
