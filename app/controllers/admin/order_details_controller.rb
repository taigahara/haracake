class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @one_order = @order.order_details
    
    if @order_detail.update!(order_detail_params)
      if params[:order_detail][:production_status] == "producing"
        @order.order_status = "producing"
        @order.save!
      end
      if @one_order.where(production_status: "complete").count == @one_order.count
        @order.order_status = "ready_to_ship"
        @order.save!
      end
        
      redirect_to admin_order_path(@order)
    end
  end
  
  private
    def order_detail_params
      params.require(:order_detail).permit(:production_status)
    end
end
