class Admin::OrdersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @orders = Order.all
    @order_products = OrderProduct.all
    @order = Order.new
    @order_product = OrderProduct.find(params[:id])
    #@delivery_address = DeliveryAddress.find(params[:id])
    #@order = Order.find(params[:id])

  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
       redirect_to request.referer
    end
  end
end
