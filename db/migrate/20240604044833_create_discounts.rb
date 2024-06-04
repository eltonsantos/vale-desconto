class CreateDiscounts < ActiveRecord::Migration[7.1]
  def change
    create_table :discounts do |t|
      t.string :image
      t.string :name
      t.text :description
      t.integer :discount_type
      t.datetime :activation_date
      t.datetime :deactivation_date
      t.boolean :status
      t.decimal :price
      t.integer :quantity_leve
      t.integer :quantity_pague
      t.decimal :price_from
      t.decimal :price_to
      t.decimal :discount_percentage

      t.timestamps
    end
  end
end
