# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :discounts, dependent: :destroy

  validates :title, :description, presence: true
end
