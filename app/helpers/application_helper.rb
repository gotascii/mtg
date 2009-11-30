module ApplicationHelper
  def card_columns(card)
    html = content_tag :td, link_to(card.titleized_name, card.url)
    html += [card.color.name, card.expansion.abbr].collect do |field|
      content_tag :td, field
    end.join
  end
end
