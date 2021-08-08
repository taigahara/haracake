class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      if(@order.order_status == "confirm_payment")
        @order_details.each do |order_detail|
          order_detail.production_status = "wait"
          order_detail.save
        end
      end
      redirect_to admin_order_path(@order)
    end
  end
  
  private
    def order_params
      params.require(:order).permit(:order_status)
    end
end
