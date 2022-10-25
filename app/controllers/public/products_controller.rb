class Public::ProductsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  def index
    @products = Product.all.page(params[:page]).per(8)
    @products_count = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = Cart

  end

  private
  def product_params
    params.require(:products).permit(:genre_id,:name,:description,:image_id,:price)
  end
end
