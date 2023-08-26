# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :order_items, dependent: :nullify
  has_many :orders ,through: :order_items
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
end
