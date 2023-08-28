class Cart < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  # LOGIC
  def sub_total
    sum = 0
    self.order_items.each do |order_item|
      sum+= order_item.total_price
    end
    return sum
  end
end
