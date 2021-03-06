class Public::CartItemsController < ApplicationController
  before_action :setup_cart_item!, only: [:create, :update]
  
  def index
    @cart_items = current_end_user.cart_items
  end
  
  def create
    @cart_item.amount += params[:cart_item][:amount].to_i
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
      params.require(:cart_item).permit(:amount)
    end
    
    def setup_cart_item!
      @cart_items = current_end_user.cart_items
      if @cart_items.find_by(item_id: session[:item_id]).present?
        @cart_item = @cart_items.find_by(item_id: session[:item_id])
      else
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.item_id = session[:item_id]
        @cart_item.amount = 0
      end
    end
end
