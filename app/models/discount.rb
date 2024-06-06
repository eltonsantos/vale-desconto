class Discount < ApplicationRecord
  before_save :calculate_price_final

  enum discount_type: { de_por: 0, leve_mais_pague_menos: 1, percentual: 2 }

  has_one_attached :image

  validates :name, :description, :discount_type, :activation_date, :deactivation_date, presence: true

  def calculate_price_final
    if discount_type == 'percentual' && price_percentual.present? && discount_percentage.present?
      self.price_final = price_percentual - (price_percentual * (discount_percentage / 100.0))
    end
  end

  
end
