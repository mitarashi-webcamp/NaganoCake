class Public::CartsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @carts = current_customer.carts.all
  end

  def create
    @carts = current_customer.carts.new(carts_params)
    if current_customer.carts.find_by(product_id: params[:cart][:product_id])
    cart_product.quantity += params[:cart][:quantity].to_i


    cart_product.save
    redirect_to carts_path


    elsif @carts.save
          @carts = current_customer.cars.all
          render 'index'

    else  render 'index'
    end
  end

  private
    def cart_params
        params.require(:cart).permit(:product_id, :price, :quantity)
    end
end
