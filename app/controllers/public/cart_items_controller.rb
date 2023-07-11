class Public::CartItemsController < ApplicationController

  def index
  end



  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = params[:item_id]
    redirect_to cart_items_path, notice: 'Successfully added product to your cart'
  end


  def update
  end


  def destroy
  end


  def destroy_all
  end



end

private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end