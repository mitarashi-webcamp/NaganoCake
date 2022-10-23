class Public::CustomersController < ApplicationController

  before_action :autheniticate_customer, {only: [:show, :edit, :update]}

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
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end
end
