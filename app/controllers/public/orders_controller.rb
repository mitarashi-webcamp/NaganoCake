class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @carts = current_customer.carts.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      @carts.each do |cart|
      order_product = OrderProduct.new
       order_product.product_id = cart.product_id
       order_product.order_id = @order.id
       order_product.count = cart.product_count
       order_product.price = cart.product.price
       order_product.save
      end
    @carts.destroy_all
    redirect_to orders_complete_path
    else
    @order = Order.new(order_params)
    render new
    end
  end

  def complete
  end

  def confirm
    @order = Order.new(order_params)
    @carts = current_customer.carts.all

    if params[:order][:address_number] == "1"
      @order.address = current_customer.address
      @order.zip_code = current_customer.zip_code
      @order.name = current_customer.last_name
      @order.name = current_customer.first_name
    elsif params[:order][:address_number] == "2"
      DeliveryAddress.exists?(id: params[:order][:address_id])
      @order.address = DeliveryAddress.find(params[:order][:address_id]).address
      @order.zip_code = DeliveryAddress.find(params[:order][:address_id]).zip_code
      @order.name = DeliveryAddress.find(params[:order][:address_id]).name
    else
    render :new

    end

    # @total = @carts.inject(0) { |sum, product| sum + product.sum_price }

  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
    @order_products = OrderProduct.all
    @products = Product.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:total_payment, :zip_code, :address, :name, :postage, :billing_amount)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end
