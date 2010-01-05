module ApplicationHelper
  def ajax_flash_message(page)
    if flash_message?
      page.replace_html 'flash', flash_message
      page << "$('#flash').removeClass()"
      page << "$('#flash').addClass('#{flash_class}')"
    end
  end

  def flash_class
    # classes = flash.keys.collect do |k|
    #   k.to_s if flash[k]
    # end.compact
    classes = flash.reject{|k, v| v.nil? }.keys
    classes.join(' ')
  end

  def flash_class_attribute
    flash_class.blank? ? "" : "class=#{flash_class}"
  end

  def flash_message
    flash.values.join("<br/>")
  end

  def flash_message?
    !flash_message.blank?
  end

  def color_image_tags(card)
    card.colors.collect do |color|
      image_tag(color.icon, :title => color.name)
    end.join('')
  end

  def card_columns(card)
    html = content_tag :td, link_to(card.titleized_name, card.url, :target => "_mtg")
    html += content_tag :td, color_image_tags(card), :class => "data"
    html += content_tag :td, image_tag(card.expansion.icon, :title => card.expansion.name), :class => "data"
    html += content_tag :td, card.card_type.try(:abbr), :class => "data"
  end

  def card_order_link(search, field, as, color)
    order(search, :by => field, :as => as, :params => {:controller => 'cards', :action => 'index', :color_id => color.try(:id)})
  end

  def pick_order_link(search, field, as, deck)
    order(search, :by => field, :as => as, :params => {:controller => 'decks', :action => 'show', :id => deck.id})
  end

  def clippy(text, bgcolor='#2f2f2f')
    html = <<-EOF
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="14"
              height="14"
              id="clippy" >
      <param name="movie" value="/flash/clippy.swf"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="text=#{text}">
      <param name="bgcolor" value="#{bgcolor}">
      <embed src="/flash/clippy.swf"
             width="14"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="text=#{text}"
             bgcolor="#{bgcolor}"
      />
      </object>
    EOF
  end
end