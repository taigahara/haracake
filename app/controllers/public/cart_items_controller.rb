class Public::CartItemsController < ApplicationController
  before_action :setup_cart_item!, only: [:update]
  
  def index
    @cart_items = current_end_user.cart_items
  end
  
  def create
    @cart_items = current_end_user.cart_items
      if @cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
        #カートアイテムを入れる時、それが2回目以降
        @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
        @cart_item.amount += params[:cart_item][:amount].to_i
      else
        #カートにアイテムを入れる時、それが初めてだったら
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.amount = params[:cart_item][:amount].to_i
      end
    @cart_item.end_user_id = current_end_user.id
    if @cart_item.save
      redirect_to cart_items_path
    end
  end
  
  def update
     @cart_item.amount += params[:cart_item][:amount].to_i
    if @cart_item.update!(cart_item_params)
      redirect_to cart_items_path
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      redirect_to cart_items_path
    end
  end
  
  def destroy_all
    @cart_items = current_end_user.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id)
    end
    
    def setup_cart_item!
      @cart_items = current_end_user.cart_items
      if @cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
        #カートアイテムを入れる時、それが2回目以降
        @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      else
        #カートにアイテムを入れる時、それが初めてだったら
        @cart_item = CartItem.new(cart_item_params)
      end
    end
end
