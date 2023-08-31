# frozen_string_literal: true

class Item < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0, message: 'must be greater than zero' }

  has_one_attached :photo
  has_many :order_items, dependent: :destroy
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
end
