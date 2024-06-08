# frozen_string_literal: true

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

  def diff(content1, content2)
    changes = Diffy::Diff.new(content1, content2, include_plus_and_minus_in_html: true, include_diff_info: true)
    changes.to_s.present? ? changes.to_s(:html).html_safe : "No Changes"
  end
end
