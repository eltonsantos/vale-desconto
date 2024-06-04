json.extract! discount, :id, :store, :image, :name, :description, :discount_type, :activation_date, :deactivation_date, :status, :price_from, :price_to, :price_leve, :price_pague, :price, :discount_percentage, :created_at, :updated_at
json.url discount_url(discount, format: :json)
