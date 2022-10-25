class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!, {only: [:show, :edit, :update]}

  def show
  end

  def edit
  end

  def comfirm
  end

  def withdraw
    customer = Customer.find(current_customer.id)
    customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
end
