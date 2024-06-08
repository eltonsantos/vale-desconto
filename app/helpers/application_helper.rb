# frozen_string_literal: true

module ApplicationHelper
  def format_price(price)
    number_to_currency(price, unit: "R$", separator: ",", delimiter: ".")
  end

  def format_percentage(percentage)
    number_to_percentage(percentage, precision: 2, separator: ",").gsub(".0", "").gsub(",00", "")
  end
end
