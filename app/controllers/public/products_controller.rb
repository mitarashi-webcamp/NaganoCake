class Public::ProductsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

  end

  private
  def product_params
    params.require(:products).permit(:genre_id,:name,:description,:image_id,:price)
  end
end
