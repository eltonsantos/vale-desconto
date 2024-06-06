class Discount < ApplicationRecord
  enum discount_type: { de_por: 0, leve_mais_pague_menos: 1, percentual: 2 }

  has_one_attached :image

  validates :name, :description, :discount_type, :activation_date, :deactivation_date, presence: true
end
