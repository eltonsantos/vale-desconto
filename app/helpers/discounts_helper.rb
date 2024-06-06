module DiscountsHelper
  def format_discount_type(discount_type)
    case discount_type
    when "leve_mais_pague_menos"
      "Leve + Pague -"
    when "de_por"
      "De / Por"
    when "percentual"
      "Percentual"
    end
  end
end
