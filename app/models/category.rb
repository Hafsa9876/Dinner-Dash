# frozen_string_literal: true

# This is Documentation
class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :item_categories, dependent: :destroy
  has_many :item, through: :item_categories
end
