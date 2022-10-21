class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    @product.save
    redirect_to admin_product_path(@product)
  end

  def index
    @products = Product.all
  end


  private

  def product_params
    params.require(:product).permit(:genre_id,:name,:note,:price,:is_active,:image)
  end

end
