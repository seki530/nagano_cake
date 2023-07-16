class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    redirect_to orders_confirm_path
  end

  def confirm
    @order = Order.new(order_params)
  end

  def complete
  end

  def index
  end

  def show
  end
end

private
   def order_params
       params.require(:order).permit(:payment)
   end
