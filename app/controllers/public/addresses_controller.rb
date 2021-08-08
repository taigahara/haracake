class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end
  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    if @address.save!
      redirect_to addresses_path
    end
  end
  
  private
    def address_params
      params.require(:address).permit(:postal_code, :ship_address, :ship_name)
    end
end
