json.extract! discount, :id, :image, :name, :description, :discount_type, :activation_date, :deactivation_date, :status, :price, :quantity_leve, :quantity_pague, :price_from, :price_to, :discount_percentage, :created_at, :updated_at
json.url discount_url(discount, format: :json)
