class ApplicationController < ActionController::Base

  def autheniticate_customer
    if @current_customer == nil
      redirect_to(new_customer_session_path)
    end
  end

end