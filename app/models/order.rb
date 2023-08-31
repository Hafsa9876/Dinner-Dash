# frozen_string_literal: true

# This is Documentation
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  validates :status, inclusion: { in: ['ordered', 'paid', 'cancelled', 'completed'] }
  validate :items, on: :create

  private

  def items
    errors.add(:base, 'Cannot create an order without items') if order_items.empty?
  end
end
