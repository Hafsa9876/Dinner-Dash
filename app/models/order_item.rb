# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :item
  belongs_to :cart
  before_create :set_default_quantity

  def total_price
    quantity * item.price
  end

  private

  def set_default_quantity
    self.quantity ||= 1
  end
end
