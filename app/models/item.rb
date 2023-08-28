# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :photo
  has_many :order_items, dependent: :destroy
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
end
