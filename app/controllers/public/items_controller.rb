class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all

    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      @items = @genre.items.where(is_sale: true)
    else
      @items = Item.where(is_sale: true)
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    session[:item_id] = @item.id
  end
end
