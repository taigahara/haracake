class Public::OrdersController < ApplicationController
  before_action :set_info, only: [:confirm]
  
  def new
    redirect_to cart_items_path unless current_end_user.cart_items.exists?
    @order = Order.new
    @addresses = current_end_user.addresses
  end
  
  def confirm
    @cart_items = current_end_user.cart_items
  end
  
  def create
    redirect_to cart_items_path unless current_end_user.cart_items.exists?
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    if @order.save!
      @cart_items = current_end_user.cart_items
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item.id
        @order_detail.amount = cart_item.amount
        @order_detail.at_order_time_price = (cart_item.item.price * 1.1).floor
        @order_detail.save!
        cart_item.destroy
      end
      redirect_to orders_complete_path
    end
  end

  
  def complete
  end
  
  def show
  end
  
  def index
  end
  
  
  
  private
  def order_params
    params.require(:order).permit(:end_user_id, :payment_method, :postal_code, :ship_address, :ship_name, :total_price, :freight)
  end
    
    def set_info
      @order = Order.new(order_params)
      @end_user = current_end_user
      @order.end_user_id = @end_user.id
      
      if params[:order][:address_option] == "0"
        @order.postal_code = @end_user.postal_code
        @order.ship_address = @end_user.ship_address
        @order.ship_name = (@end_user.first_name + " " + @end_user.last_name)
      elsif params[:order][:address_option] == "1"
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.ship_address = @address.ship_address
        @order.ship_name = @address.ship_name
      elsif params[:order][:address_option] == "2"
        @order.postal_code = params[:order][:postal_code]
        @order.ship_address = params[:order][:ship_address]
        @order.ship_name = params[:order][:ship_name]
      end
      
      if params[:order][:payment_method] == "0"
        @order.payment_method = 0
      elsif params[:order][:payment_method] == "1"
        @order.payment_method = 1
      end
      
    end
end
