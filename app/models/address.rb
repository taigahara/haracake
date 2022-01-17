class Address < ApplicationRecord
  belongs_to :end_user

  def full_address
    '〒' + postal_code + ' ' + ship_address + ' ' + ship_name
  end

end