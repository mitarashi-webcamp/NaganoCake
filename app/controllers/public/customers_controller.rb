class Public::CustomersController < ApplicationController

  before_action :autheniticate_customer, {only: [:show, :edit, :update]}

  def show
  end

  def edit
  end

  def comfirm
  end
end
