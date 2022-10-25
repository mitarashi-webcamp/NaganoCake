class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @order_products = OrderProduct.all
  end
end
