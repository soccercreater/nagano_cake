class OrderDetail < ApplicationRecord
      belongs_to :item
      belongs_to :order
      def sum_of_price
          (item.price * 1.1 * amount).floor
      end
end
