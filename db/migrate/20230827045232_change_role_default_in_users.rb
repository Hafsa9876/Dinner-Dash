# frozen_string_literal: true

# This is Documentation
class ChangeRoleDefaultInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role, :integer, default: 0
  end
end
