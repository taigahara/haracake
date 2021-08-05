class Public::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(current_end_user.id)
  end
  
  def edit
    @end_user = EndUser.find(current_end_user.id)
  end
  
  def update
    @end_user = EndUser.find(current_end_user.id)
    if @end_user.update(end_user_params)
      redirect_to end_users_mypage_path
    else
      render end_users_mypage_edit_path
    end
  end
  
  def confirm
  end
  
  def withdrow
    end_user = EndUser.find(current_end_user.id)
    end_user.is_deleted = true
    end_user.save
    if end_user.destroy
      redirect_to root_path
    end
  end

  
  protected
    def end_user_params
      params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :phone_number, :ship_address, :phone_number, :email)
    end
end
