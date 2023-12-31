# frozen_string_literal: true

# This is Documentation
class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
