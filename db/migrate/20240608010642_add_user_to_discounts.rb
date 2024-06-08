# frozen_string_literal: true

class AddUserToDiscounts < ActiveRecord::Migration[7.1]
  def change
    add_reference(:discounts, :user, null: false, foreign_key: true)
  end
end
