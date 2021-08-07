class CartItem < ApplicationRecord
  belongs_to :end_user, optional: true
  belongs_to :item, optional: true
end
