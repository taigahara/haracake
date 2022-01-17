class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def show
    # binding.pry
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    session[:item_id] = @item.id
  end
end
