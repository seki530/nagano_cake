class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:format])
		@order_details = @order.order_details
  end
end
