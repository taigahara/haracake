class Genre < ApplicationRecord
  has_many :items

  def self.search(keyword)
    where(["name LIKE ?", "%#{keyword}%"])
  end
  
end
