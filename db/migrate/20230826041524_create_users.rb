# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :full_name
      t.string :display_name
      t.string :role

      t.timestamps
    end
    add_index :users, :email
  end
end
