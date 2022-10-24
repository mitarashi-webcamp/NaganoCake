class Admin::OrdersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @orders = Order.all
    @order_products = OrderProduct.all
    #@products = Product.all


  end
end
