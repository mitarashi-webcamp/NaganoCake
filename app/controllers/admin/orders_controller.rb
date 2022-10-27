class Admin::OrdersController < ApplicationController
before_action :authenticate_admin!
  def show
    #@customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_products = OrderProduct.where(order_id: @order.id)
    @order_new = Order.new
    @order_product = OrderProduct.find(params[:id])
    @status_key = Order.statuses_i18n.invert
    @making_status_key = OrderProduct.making_statuses_i18n.invert

    #@delivery_address = DeliveryAddress.find(params[:id])


  end

  def update
    @order = Order.find(params[:id])
     @order.update(order_params)
       if @order.status == "payment_confirmation"
         @order.order_products.update(making_status: 1)

       end
       redirect_to request.referer


  end



 private

  def order_params
    params.require(:order).permit(:status)
  end
end
