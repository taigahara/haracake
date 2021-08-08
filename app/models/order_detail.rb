class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum production_status: [:not_startable, :wait, :producing, :complete]
end
