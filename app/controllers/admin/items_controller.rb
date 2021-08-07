class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Items.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item)
  end
  
  private
   def item_params
     params.require(:item).permit(:genre_id, :name, :introdution, :image, :price, :is_sale)
   end
end
