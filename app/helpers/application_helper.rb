# frozen_string_literal: true

module ApplicationHelper
  def format_price(price)
    number_to_currency(price, unit: "R$", separator: ",", delimiter: ".")
  end

  def format_percentage(percentage)
    number_to_percentage(percentage, precision: 2, separator: ",").gsub(".0", "").gsub(",00", "")
  end

  def format_changes(object_changes)
    if object_changes.present?
      changes_hash = object_changes.deep_symbolize_keys
      changes_html = ""
      
      changes_hash.each do |attribute, values|
        before_value, after_value = values
        changes_html += "<strong>#{attribute}:</strong><br>"
        changes_html += "<ul class='list-unstyled'>"
        changes_html += "<li>"
        changes_html += "<span class='bg-danger text-white px-1 rounded p-2 m-1'>#{before_value}</span>"
        changes_html += " => "
        changes_html += "<span class='bg-success text-dark px-1 rounded p-2 m-1'>#{after_value}</span>"
        changes_html += "</li>"
        changes_html += "</ul>"
      end
      
      changes_html.html_safe
    else
      "Sem alterações registradas"
    end
  end
  
end
