class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @orders = Order.all
    @order_new = Order.new
    @order_products = OrderProduct.all




  end
end
