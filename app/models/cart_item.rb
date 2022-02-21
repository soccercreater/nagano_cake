class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def sum_of_price
    (item.price * 1.1 * amount).floor
  end

  validates :item_id, presence: true
end
