# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.binary :photo

      t.timestamps
    end
  end
end
