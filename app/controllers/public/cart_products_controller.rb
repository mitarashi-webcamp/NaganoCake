class Public::CartProductsController < ApplicationController
  before_action :authenticate_member!
  def index
    @cart_products = current_customer.cart_products.all
  end

  def create
    @cart_product = current_customer.cart_products.new(cart_product_params)
    if current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id])
    cart_product.quantity += params[:cart_product][:quantity].to_i


    cart_product.save
    redirect_to cart_products_path


    elsif @cart_product.save
          @cart_products = current_customer.cart_products.all
          render 'index'

    else  render 'index'
    end
  end

  private
    def cart_product_params
        params.require(:cart_product).oermit(:product_id, :price, :quantity)
    end
end
