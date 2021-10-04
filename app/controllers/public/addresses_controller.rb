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

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to addresses_path
  end

  private
    def address_params
      params.require(:address).permit(:postal_code, :ship_address, :ship_name)
    end
end
