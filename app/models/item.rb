class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  def self.search(keyword)
    where(["name LIKE ?", "%#{keyword}%"])
  end

end
