class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.save
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price
      @order_details.amount = cart_item.amount
      @order_details.save!
    end

    CartItem.destroy_all
    redirect_to orders_complete_path
  end


  def confirm
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.postage = 800
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
    @cart_items = current_customer.cart_items

    @order_new = Order.new
    render :confirm
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
       params.require(:order).permit(:payment, :postage, :postal_code, :address, :name, :billing_amount, :customer_id)
   end
