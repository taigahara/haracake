class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_details

  enum payment_method: [:credit,:bank]
  enum order_status: [:wait_for_payment, :confirm_payment, :producing, :ready_to_ship, :complete_ship]
  
end
