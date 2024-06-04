class CreateDiscounts < ActiveRecord::Migration[7.1]
  def change
    create_table :discounts do |t|
      t.string :store
      t.string :image
      t.string :name
      t.text :description
      t.integer :discount_type
      t.datetime :activation_date
      t.datetime :deactivation_date
      t.boolean :status
      t.decimal :price_from
      t.decimal :price_to
      t.decimal :price_leve
      t.decimal :price_pague
      t.decimal :price
      t.decimal :discount_percentage

      t.timestamps
    end
  end
end
