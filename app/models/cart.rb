# frozen_string_literal: true

# This is Documentation
class Cart < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  def sub_total
    sum = 0
    order_items.each do |order_item|
      sum += order_item.total_price
    end
    return sum
  end
end
