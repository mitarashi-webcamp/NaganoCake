class Public::CartsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @carts = current_customer.carts.all
  end

  def create
    @carts = current_customer.carts.new(cart_params)
    if current_customer.carts.find_by(product_id: params[:cart][:product_id]).present?
      current_customer.carts.find_by(product_id: params[:cart][:product_id])
       @carts.product_count += params[:cart][:product_count].to_i
       @carts.save!
       redirect_to carts_path

    elsif @carts.save
          @carts = current_customer.cart.all
          render 'index'

    else  render 'index'
    end
  end

  def destroy
    @cart_product = Cart.find(params[:id])
     cart_product.destroy
    @cart_products = Cart.all
     render 'index'
  end

  def all_destroy
    @cart_products = Cart.all
    cart_products.destroy_all
     render 'index'
  end


  private
    def cart_params
        params.require(:cart).permit(:product_id, :price, :product_count)
    end
end
