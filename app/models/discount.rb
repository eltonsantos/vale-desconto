class Discount < ApplicationRecord
  has_paper_trail

  before_save :calculate_price_final

  belongs_to :product
  belongs_to :user

  enum discount_type: { de_por: 0, leve_mais_pague_menos: 1, percentual: 2 }

  has_one_attached :image

  validates :name, :description, :discount_type, :activation_date, :deactivation_date, presence: true

  def calculate_price_final
    if discount_type == 'percentual' && price_percentual.present? && discount_percentage.present?
      self.price_final = price_percentual - (price_percentual * (discount_percentage / 100.0))
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[activation_date created_at deactivation_date description discount_percentage discount_type id id_value image name price price_final price_from price_percentual price_to quantity_leve quantity_pague status updated_at]
  end
end
