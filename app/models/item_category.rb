# frozen_string_literal: true

# This is Documentation
class ItemCategory < ApplicationRecord
  belongs_to :item
  belongs_to :category
end
