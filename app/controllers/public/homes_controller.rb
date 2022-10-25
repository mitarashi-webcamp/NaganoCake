class Public::HomesController < ApplicationController

  #skip_before_action :authenticate_customer!

  def top
    @products = Product.all
  end

  def about
  end
end
