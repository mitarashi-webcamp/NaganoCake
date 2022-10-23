class Public::DeliveryAddressesController < ApplicationController
  def index
    @delivery_address = DeliveryAddress.new
    @delivery_addresses = DeliveryAddress.where(customer_id: current_customer.id)
  end

  def create
    delivery_address = DeliveryAddress.new(delivery_address_params)
    delivery_address.customer_id = current_customer.id
    delivery_address.save
    redirect_to delivery_addresses_path
  end

  def edit
  end


  private

  def delivery_address_params
    params.require(:delivery_address).permit(:zip_code, :address, :name)
  end

end
