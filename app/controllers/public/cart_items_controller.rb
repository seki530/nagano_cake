class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end



  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    
    if current_customer.cart_items.find_by(item_id: params[:item_id]).present?
      @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
      @cart_item.amount += params[:amount].to_i
      @cart_item.save
      flash[:notice] = "商品の個数が変更されました！"
      redirect_to cart_items_path
      
    elsif 
      @cart_item.save
      redirect_to cart_items_path
      
    else
      redirect_to cart_items_path
    end

  end


  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path(@cart_item)
  end


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end


  def destroy_all
     @cart_item = current_customer.cart_items
     @cart_item.destroy_all
     redirect_to destroy_all_path
  end



end

private
  def cart_item_params
      params.permit(:item_id, :amount, :customer_id)
  end