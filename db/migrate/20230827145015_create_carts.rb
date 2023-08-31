# frozen_string_literal: true

# This is Documentation
class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.timestamps
    end
  end
end
