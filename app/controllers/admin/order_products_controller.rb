class Admin::OrderProductsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
     @order_product.update(order_product_params)
     if @order_product.making_status == "now_production"
       @order_product.order.update(status: 2)
     end
      if @order_product.making_status == "production_completed"
         @order_product.order.update(status: 3)
      end
       redirect_to request.referer
  end


 private

  def order_product_params
    params.require(:order_product).permit(:making_status)
  end
end
