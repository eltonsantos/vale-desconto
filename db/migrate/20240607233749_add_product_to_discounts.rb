# frozen_string_literal: true

class AddProductToDiscounts < ActiveRecord::Migration[7.1]
  def change
    add_reference(:discounts, :product, null: false, foreign_key: true)
  end
end
