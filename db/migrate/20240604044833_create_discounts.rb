# frozen_string_literal: true

class CreateDiscounts < ActiveRecord::Migration[7.1]
  def change
    create_table(:discounts) do |t|
      t.string(:image)
      t.string(:name)
      t.text(:description)
      t.integer(:discount_type)
      t.datetime(:activation_date)
      t.datetime(:deactivation_date)
      t.boolean(:status)
      t.decimal(:price, precision: 10, scale: 2)
      t.integer(:quantity_leve)
      t.integer(:quantity_pague)
      t.decimal(:price_from, precision: 10, scale: 2)
      t.decimal(:price_to, precision: 10, scale: 2)
      t.decimal(:discount_percentage, precision: 10, scale: 2)
      t.decimal(:price_percentual, precision: 10, scale: 2)
      t.decimal(:price_final, precision: 10, scale: 2)

      t.timestamps
    end
  end
end
