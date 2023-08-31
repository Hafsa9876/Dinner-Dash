# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  validate :items?, on: :create
  validates :status, inclusion: { in: ['ordered', 'paid', 'cancelled', 'completed'] }

  private

  def items?
    errors.add(:base, 'Cannot create an order without items') if order_items.empty?
  end
end
