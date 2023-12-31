# frozen_string_literal: true

# This is Documentation
class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity
      t.decimal :subtotal

      t.timestamps
    end
  end
end
