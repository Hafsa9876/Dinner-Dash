# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  validate :has_items, on: :create
  validates :status, inclusion: { in: ["ordered", "paid", "cancelled", "completed"] }
  private

  def has_items
    if order_items.empty?
      errors.add(:base, "Cannot create an order without items")
    end
  end

end
