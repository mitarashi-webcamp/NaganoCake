class Public::CartsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @carts = current_customer.carts.all
  end

  def create
    @carts = Cart.new(cart_params)
    @carts.customer_id = current_customer.id

    if current_customer.carts.find_by(product_id: params[:cart][:product_id]).present?
       @cart_product = current_customer.carts.find_by(product_id: params[:cart][:product_id])
       product_count = params[:cart][:product_count].to_i + @cart_product.product_count
       @cart_product.update_attribute(:product_count,product_count)
       @carts.delete

       redirect_to carts_path

    elsif @carts.save
        redirect_to carts_path

    else
      render 'public/products/show'
    end
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(product_count: params[:cart][:product_count].to_i)
    redirect_to carts_path
  end

  def destroy
    @cart_product = Cart.find(params[:id])
    @cart_product.destroy
    @cart_products = Cart.all
     redirect_to carts_path
  end

  def all_destroy
    @cart_products = Cart.all
    @cart_products.destroy_all
     redirect_to carts_path
  end


  private
    def cart_params
        params.require(:cart).permit(:product_id, :price, :product_count)
    end
end
