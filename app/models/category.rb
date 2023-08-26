# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :item_categories, dependent: :destroy
  has_many :item, through: :item_categories
end
