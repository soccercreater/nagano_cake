class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    # @address = Address.current_customer.id
    @addresses = Address.all
  end

  def edit
   @address = Address.new
   @address = current_customer.address.id
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def update
  end

  def destroy
  end

  private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end
end
