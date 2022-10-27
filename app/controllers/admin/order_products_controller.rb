class Admin::OrderProductsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
     @order_product.update(order_product_params)
     if @order_product.making_status == "now_production"
       @order_product.order.update(status: 2)

     elsif OrderProduct.where(making_status: "production_completed", order_id: @order_product.order_id).count == @order_product.order.order_products.count


        @order_product.order.update(status: 3)
     end
       redirect_to request.referer
  end


 private

  def order_product_params
    params.require(:order_product).permit(:making_status)
  end
end
